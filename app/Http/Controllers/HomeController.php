<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use App\Models\Post;
use App\Models\Shop;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use App\Models\Category;
use Hamcrest\Core\IsNull;
use DASPRiD\Enum\NullValue;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Mail\ShopActivationRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Stevebauman\Location\Facades\Location;
use Illuminate\Pagination\LengthAwarePaginator;

class HomeController extends Controller
{
    //
    public function index()
    {

        $products = DB::select('select * from products');
        $products = Product::where('id','>' ,1)
        ->inRandomOrder()
        ->take(6)
        ->get();

        $categories = Category::where('featured',1)->where('menu',1)->whereNotNull('parent_id')->inRandomOrder()->take(4)->get();
        $featprods = Product::where('featured',1)->inRandomOrder()->take(6)->get();

        return view('home.home',['allcategories'=>$categories,'allproducts'=>$products, 'featprods'=>$featprods]);
    }

    public function location(Request $request)
    {
        $products = null;

        $userIp = $request->ip();
        $position = Location::get("$userIp");

        if(!$position){
            return back()->with('success','Oh no could not find your location. 😥');
        }
        $location = $position->regionName;

        $latitude       =       $position->latitude;
        $longitude      =      $position->longitude;

        $shops          =       DB::table("shops");

        $shops          =       $shops->select("*", DB::raw("6371 * acos(cos(radians(" . $latitude . "))
                                * cos(radians(latitude)) * cos(radians(longitude) - radians(" . $longitude . "))
                                + sin(radians(" .$latitude. ")) * sin(radians(latitude))) AS distance"));
        // $shops          =       $shops->having('distance', '>', 20);
        // $shops          =       $shops->orderBy('distance', 'asc');

        $shops          =       $shops->get();



        foreach ($shops as $s) {
            if(is_null($products)){

                $products = Product::where('shop_id', $s->id)->take(6)->get();
            }
            else{
                $products1 = Product::where('shop_id', $s->id)->take(6)->get();
                $products = $products->concat($products1);
            }

        }

        if(is_null($products)){
            $products = Product::where('id','>' ,1)
            ->orderBy('name')
            ->take(6)
            ->get();
            $featprods = Product::where('featured',1)->take(6)->get();


        }
        else{
            $featprods =$products->where('featured',1)->random(6);
            $products = $products->random(6);
        }


        $categories = Category::where('featured',1)->inRandomOrder()->take(4)->get();



        return view('home.location',['allcategories'=>$categories,'allproducts'=>$products, 'location'=>$location, 'featprods'=>$featprods]);
    }

    public function categories()
    {
        $categories = Category::whereNotNull('parent_id')->get();
        // dd($categories);

        return view('home.categories.categories',['categories'=>$categories]);
    }
    public function explore(Request $request)
    {

        // $products = DB::select('select * from products');
        $products = Product::where('id','>' ,1)
        ->orderBy('name')
        ->take(4)
        ->get();
        $categories = Category::whereNotNull('parent_id')->get();
        $posts = Post::paginate(5);


        $array = Post::limit(50)->get();
        $total=count($array);
        $per_page = 5;
        $current_page = $request->input("page") ?? 1;

        $starting_point = ($current_page * $per_page) - $per_page;

        $array = $array->toArray();
        $array = array_slice($array, $starting_point, $per_page, true);

        // $array = array_slice($array, $starting_point, $per_page, true);

        $array = new LengthAwarePaginator($array, $total, $per_page, $current_page, [
            'path' => $request->url(),
            'query' => $request->query(),
        ]);



        return view('home.explore',['allcategories'=>$categories,'allproducts'=>$products, 'posts'=>$posts, 'array'=>$array, 'current_page'=>$current_page]);
    }
    public function search(Request $request)
    {
        $querystr = $request->input('query');

        $products = Product::where('name','like','%'.$querystr.'%')
        ->orWhere('description','like','%'.$querystr.'%')
        ->orWhereHas('category', function ($query) use ($querystr) {
            $query->where('name', 'like', '%'.$querystr.'%');
        })
        ->orderBy('rating')
        ->paginate(20);

        $shops = Shop::where('name','like','%'.$querystr.'%')
        ->take(5)->get();
        // $products = Product::where('name',$query)->get();
        // dd($shops);
        return view('home.search',['allproducts'=>$products, 'shops'=>$shops]);
    }
    public function post(Post $post)
    {
        $shop=$post->shop;
        $subscribed=[];
        if(Auth::user()){
            $user_id = Auth::user()->id;
            $user = User::find($user_id);
            $subscribed=$user->subscriptions()->where('shop_id',$shop->id)->random(6)->get();
        }
        // dd($post);

        return view('home.post',[ 'post'=>$post, 'shop'=>$shop, 'subscribed'=>$subscribed]);
    }
    public function shop($shop_id)
    {
        $subscribed=[];
        if(Auth::user()){
            $user_id = Auth::user()->id;
            $user = User::find($user_id);
            $subscribed=$user->subscriptions()->where('shop_id',$shop_id)->get();
        }

        // dd($subscribed);
        // $shop = $user->shop()->create([
        //     'name' => 'Osioe',
        //     'descriptiom' => 'mai mai',
        // ]);

        //Mail::to($user)->send(new ShopActivationRequest($shop));
        // $products = DB::select('select * from products where shop_id = :id', ['id' => $shop_id]);
        $shop = Shop::find($shop_id);
        $posts = Shop::find($shop_id)->posts;
        $products = $shop->products;
        $products1 = $shop->products()->where('featured',1)->get();
        //$post = Post::where('shop_id',$shop_id)->get();
        // dd($products1);
        $cats = [];

        foreach ($products as $prod) {
            if(count($prod->category->all())){
            // dd($prod->category[0]);
                if (in_array($prod->category[0]->name, $cats)){
                    //silence is key
                }
                else{

                    array_push($cats,$prod->category[0]->name);
                }
            }
        }


        return view('home.shop',['allproducts'=>$products,'allproducts1'=>$products1, 'allposts'=>$posts,'cats'=>$cats, 'shop'=>$shop, 'subscribed'=>$subscribed]);
    }
    public function shops(){
        $shops = Shop::where('is_active',1)->withCount('followers')->orderBy('followers_count', 'desc')->take(100)->get();
        $moreshops = Shop::where('is_active',1)->withCount('followers')->orderBy('followers_count', 'desc')->take(100)->get();

        $shopids = [];
        $user = User::find(Auth::user()->id);
        $subscription = $user->subscriptions;
        foreach ($subscription as $sub){
            array_push($shopids,$sub->id);
            $shops = $shops->except($sub->id);
            $moreshops = $moreshops->except($sub->id);
        }
        $shops=$shops->take(4);
        $moreshops=$moreshops->take(20);


        return view('home.messaging.shops',['topshop'=>$shops,'moreshops'=>$moreshops]);
    }
    public function openshop(){
        return view('shop.openshop');
    }
    public function tag(Tag $tag)
    {



        // $categories = DB::select('select * from categories where parent_id = :parent_id', ['parent_id' => null]);
        //$categories = DB::select('select * from categories ', [0]);
        $categories = Category::whereNull('parent_id')->get();

        $spectag = Tag::where('id',$tag->id)->get();
        // dd($speccat);
        $products = $tag->products->shuffle()->take(15);
        // dd($products);

        return view('home.category',['allcategories'=>$categories, 'allproducts'=>$products, 'category1'=>$spectag], compact('products'));
    }
    public function category(Category $category)
    {
        $categories = Category::whereNull('parent_id')->get();

        $speccat = Category::where('id',$category->id)->get();
        $products = $category->products->shuffle()->take(15);

        return view('home.category',['allcategories'=>$categories, 'allproducts'=>$products, 'category1'=>$speccat], compact('products'));
    }
    public function product($productid)
    {

        $categories = Category::whereNull('parent_id')->get();
        $product =Product::find($productid);

        $cat = $product->category;
        $related = [$product];
        foreach($cat as $c){
            $related =$c->products->shuffle()->take(6);
        }

        $shop = $product->shop;
        $comments =  $product->comments;
        $tags = $product->tags;

        $comments = $comments->sortByDesc('created_at');
        // dd($tags);

        return view('home.product',['allcategories'=>$categories, 'product'=>$product,'tags'=>$tags,'related'=>$related, 'shop'=>$shop, 'comments'=>$comments]);
    }
    public function profile(){
        $user = Auth::user();
        $orders = Order::where('user_id',$user->id)->orderByDesc('created_at')->paginate(5);

        $moreshops = Shop::where('is_active',1)->orderByDesc('rating')->take(100)->get();

        $shopids = [];
        $user = User::find(Auth::user()->id);
        $subscription = $user->subscriptions;
        foreach ($subscription as $sub){
            array_push($shopids,$sub->id);
            $moreshops = $moreshops->except($sub->id);
        }

        $moreshops=$moreshops->take(5);

        return view('home.profile.profile', ['user'=>$user,'moreshops'=>$moreshops, 'orders'=>$orders]);
    }
}
