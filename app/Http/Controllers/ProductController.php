<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use App\Models\Values;
use App\Models\Product;
use App\Models\Category;
use App\Models\User;
use App\Models\Attribute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function messages()
    {
        return [
            'images.max' => 'Additional product images may not be more than 5',
        ];
    }
     public function store(Request $request)
    {
        $request->validate([
            'image' => 'required',
            'image.*' => 'mimes:jpeg,jpg,png,gif,webp,csv|max:20048',
            'images.*' => 'mimes:jpeg,jpg,png,gif,webp,csv|max:50048',
            'images' =>  'max:5',
            'name' => 'required',
            'full_specs' => 'required',
            'description' => 'required',
            'price' => 'required',
        ]);
            // dd($request->file('image') );

        if($request->image) {
            foreach($request->image as $file)
            {

                $name = $file->getClientOriginalName();
                // Resize image
                $filelg = Image::make($file)->fit(600)->encode('webp');

                $filesm = Image::make($file)->fit(100)->encode('webp');

                // Create hash value
                $hash = md5($file->__toString());

                // Prepare qualified image name
                $image = $hash.".webp";

                // Put image to storage
                Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());

                // $file->put(public_path().'/uploads/'.Auth::user()->id, $name);
                $imgData[] = $image;

            }

            $imgDatas = NULL;
            if($request->hasfile('images'))
            {
               foreach($request->file('images') as $file)
               {
                $name = $file->getClientOriginalName();
                // Resize image
                $filelg = Image::make($file)->fit(600)->encode('webp');

                $filesm = Image::make($file)->fit(100)->encode('webp');

                // Create hash value
                $hash = md5($file->__toString());

                // Prepare qualified image name
                $image = $hash.".webp";

                // Put image to storage
                Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());

                // $file->put(public_path().'/uploads/'.Auth::user()->id, $name);
                $imgDatas[] = $image;
               }
            }


            $product = new Product();
            // $fileModal->name = json_encode($imgData);
            $product->cover_img = json_encode($imgData);
            $product->more_imgs = json_encode($imgDatas);
            $product->name = $request->name;
            $product->shop_id = User::find(Auth::user()->id)->shop->id;
            $product->full_specs = $request->full_specs;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->status = $request->stock;


            // dd(Category::find($request->category)->products);
            $product->save();
            Category::find($request->category)->products()->save($product);

           return back()->with('success', 'Product has been added!');
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
        $attributes = Attribute::where('id','>' ,0)
        ->orderBy('name')
        ->get();

        return view('shop.edit_product',['product'=>$product, 'attributes'=>$attributes]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([

            'image.*' => 'mimes:jpeg,jpg,png,gif,csv,txt,pdf|max:20048',
            'images.*' => 'mimes:jpeg,jpg,png,gif,webp,csv|max:50048',
            'images' =>  'max:5',

        ]);

            // dd($request);
        if($request->image) {
            foreach($request->image as $file)
            {
                $name = $file->getClientOriginalName();
                // Resize image
                $filelg = Image::make($file)->fit(600)->encode('webp');

                $filesm = Image::make($file)->fit(100)->encode('webp');

                $hash = md5($file->__toString());

                // Prepare qualified image name
                $image = $hash.".webp";

                // Put image to storage
                Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());

                // $file->put(public_path().'/uploads/'.Auth::user()->id, $name);
                $imgData[] = $image;


            }
        }

        $imgDatas = NULL;
        if($request->hasfile('images'))
        {
           foreach($request->file('images') as $file)
           {
            $name = $file->getClientOriginalName();
            // Resize image
            $filelg = Image::make($file)->fit(600)->encode('webp');

            $filesm = Image::make($file)->fit(100)->encode('webp');

            // Create hash value
            $hash = md5($file->__toString());

            // Prepare qualified image name
            $image = $hash.".webp";

            // Put image to storage
            Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
            Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());

            // $file->put(public_path().'/uploads/'.Auth::user()->id, $name);
            $imgDatas[] = $image;
           }
        }


            $product = Product::find($request->id);

            if($request->image){
                $cover  = $product->cover_img;
                $cover = substr($cover, 1);
                $cover = substr($cover, 1);
                $cover = substr_replace($cover ,"",-1);
                $cover = substr_replace($cover ,"",-1);


                Storage::delete("uploads/".Auth::user()->id."/".$cover);
                Storage::delete("uploads/".Auth::user()->id."/cache"."/".$cover);

                // $myImage->file= $request->file('file')->store('name-of-folder');

                $product->cover_img = json_encode($imgData);

            }
            if($request->hasfile('images'))
            {
                $images = json_decode($product->more_imgs);
                if(!$images==NULL){
                    foreach ($images as $img){
                        Storage::delete("uploads/".Auth::user()->id."/".$img);
                        Storage::delete("uploads/".Auth::user()->id."/cache"."/".$img);
                    }
                }
                $product->more_imgs = json_encode($imgDatas);

            }

            if($request->has('name')){
                $product->name = $request->name;

            }
            if($request->has('featured')){
                $product->featured = $request->featured;

            }
            if($request->has('categories')){

                $product->category()->detach();
                foreach($request->categories as $category){
                    Category::find($category)->products()->save($product);
                }

            }
            if($request->has('tags')){
                $product->tags()->detach();
                $tags = explode(',',$request->tags[0]);
                foreach($tags as $tag){

                    $t = Tag::where('name', $tag)->first();
                    if($t==null){
                        $newtag = new Tag();
                        $newtag->name = $tag;
                        $newtag->save();
                        $newtag->refresh();
                        $newtag->products()->attach($product);
                    }
                    else{
                        $t->products()->attach($product);
                    }
                }

            }
            if($request->has('full_specs')){
                // dd($request->full_specs);
                $product->full_specs = $request->full_specs;

            }
            if($request->has('description')){
                // dd($request->description);
                $product->description = $request->description;

            }
            if($request->has('price')){
                $product->price = $request->price;

            }
            if($request->has('stock')){
                $product->status = $request->stock;

            }


            $attributes = Attribute::where('id','>' ,0)
            ->orderBy('name')
            ->get();

            foreach ($attributes as $attribute){
                if($request->has('att'.$attribute->id)){
                    $damn = 'att'.$attribute->id;
                    Attribute::find($request->$damn)->products()->save($product);
                }
                else{
                    Attribute::find($attribute->id)->products()->detach($product);
                }
            }

            // Delete all previous prodiuct values
            $values = $product->values;

            foreach ($values as $v){
                $v->delete();
            }

            $colors = [];
            if($request->color1){
                array_push($colors,$request->color1);
            }
            if($request->color2){
                array_push($colors,$request->color2);
            }
            if($request->color3){
                array_push($colors,$request->color3);
            }
            if($request->color4){
                array_push($colors,$request->color4);
            }
            if($request->color5){
                array_push($colors,$request->color5);
            }
            if($request->color6){
                array_push($colors,$request->color6);
            }
            if($colors){
                $colors =implode(',',$colors);
                $prodcolor = new Values();
                $prodcolor->attribute_id = $request->colorid;
                $prodcolor->product_id =$product->id;
                $prodcolor->value = $colors;
                $prodcolor->save();

            }

            $sizes = [];
            if($request->sizes){
                array_push($sizes,$request->sizes);
            }
            if($request->sizem){
                array_push($sizes,$request->sizem);
            }
            if($request->sizel){
                array_push($sizes,$request->sizel);
            }
            if($request->sizexl){
                array_push($sizes,$request->sizexl);
            }
            if($sizes){
                $sizes =implode(',',$sizes);
                $prodcolor = new Values();
                $prodcolor->attribute_id = $request->sizeid;
                $prodcolor->product_id =$product->id;
                $prodcolor->value = $sizes;
                $prodcolor->save();
            }


            if($request->has('numbersize')){
                $prodcolor = new Values();
                $prodcolor->attribute_id = $request->numbersizeid;
                $prodcolor->product_id =$product->id;
                $prodcolor->value = $request->numbersize;
                $prodcolor->save();

            }


            $product->shop_id = User::find(Auth::user()->id)->shop->id;
            $product->save();
            $product->refresh();
           return back()->with('success', 'Product has been edited!');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $cover  = $product->cover_img;
        $cover = substr($cover, 1);
        $cover = substr($cover, 1);
        $cover = substr_replace($cover ,"",-1);
        $cover = substr_replace($cover ,"",-1);


        Storage::delete("uploads/".Auth::user()->id."/".$cover);
        Storage::delete("uploads/".Auth::user()->id."/cache"."/".$cover);

        $product->delete();
        return back()->with('success', 'Product has been deleted!');

    }




    public function getProduct(Product $product)
    {

        return $product;
    }
    public function getProducts()
    {
        $products = Product::all()
        ->orderBy('name')
        ->take(2)
        ->get()
        ;

        return $products;
    }

    public function searchProduct(Request $request)
    {
        $querystr = $request->input('query');

        $products = Product::where('name','like','%'.$querystr.'%')
        // ->orWhere('description','like','%'.$querystr.'%')
        ->orWhereHas('category', function ($query) use ($querystr) {
            $query->where('name', 'like', '%'.$querystr.'%');
        })
        // ->orderBy('rating')
        ->paginate(20);

        return $products;
    }

}
