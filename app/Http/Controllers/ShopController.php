<?php

namespace App\Http\Controllers;


use App\Models\Shop;
use App\Models\User;
use App\Models\Product;
use App\Models\Attribute;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Mail;
use App\Mail\ShopActivationRequest;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $shop = User::find(Auth::user()->id)->shop;
        // dd(User::find(Auth::user()->id)->shop);
        $shop = Shop::find($shop->id);
        // $this->authorize('update', $shop);

        $orders = $shop->order;
        if($shop->is_active){
            return view('shop.index', ['orders'=>$orders, 'shop'=>$shop]);
        }
        else{
        return view('shop.innactive');
        }

    }
    public function orders(Shop $shop)
    {

        $shopid = User::find(Auth::user()->id)->shop->id;
        $shop = Shop::find($shopid);
        // $this->authorize('update', $shop);
        $orders = $shop->order;
        // dd($orders);
        if($shop->is_active){
            return view('shop.orders', ['orders'=>$orders]);
        }
        else{
        return view('shop.innactive');
        }

    }

    public function history(Shop $shop)
    {
        $shopid = User::find(Auth::user()->id)->shop->id;
        $shop = Shop::find($shopid);
        // $this->authorize('update', $shop);
        $orders = $shop->order;
        if($shop->is_active){
            return view('shop.orderHistory', ['orders'=>$orders]);
        }
        else{
        return view('shop.innactive');
        }
    }

    public function products(Shop $shop)
    {
        $shopid = User::find(Auth::user()->id)->shop->id;
        $shop = Shop::find($shopid);
        // $this->authorize('update', $shop);

        $attributes = Attribute::where('id','>' ,0)
        ->orderBy('name')
        ->get();
        // dd($attributes);


        $products = $shop->products;
        // dd($products);
        if($shop->is_active){
            return view('shop.products',['products'=>$products, 'attributes'=>$attributes]);
        }
        else{
        return view('shop.innactive');
        }
    }
    public function posts(Shop $shop)
    {
        $shopid = User::find(Auth::user()->id)->shop->id;
        $shop = Shop::find($shopid);
        // $this->authorize('update', $shop);

        $posts = $shop->posts;
        // dd($p);
        if($shop->is_active){
        return view('shop.posts',['posts'=>$posts]);
        }
        else{
        return view('shop.innactive');
        }
    }
    public function settings(Shop $shop)
    {
        $shopid = User::find(Auth::user()->id)->shop->id;
        $shop = Shop::find($shopid);
        // $this->authorize('update', $shop);

        return view('shop.shopSettings',['shop'=>$shop]);
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
    public function store(Request $request)
    {

        if(User::find(Auth::user()->id)->shop){
            return view('shop.innactive');
          }
          else{


            $usershop = User::find(Auth::user()->id );

            $request->validate([
                // 'display_image' => 'required',
                // 'display_image.*' => 'mimes:jpeg,jpg,png,gif,csv,txt,pdf|max:2048',
                // 'cover_image' => 'required',
                // 'cover_image.*' => 'mimes:jpeg,jpg,png,gif,csv,txt,pdf|max:2048',

              ]);
              $imgData2=[];
              $imgData=[];
                  // dd($request->file('image') );

              if($request->display_image) {
                  foreach($request->display_image as $file)
                  {
                    $name = $file->getClientOriginalName();
                    // Resize image
                    $filelg = Image::make($file)->fit(600)->encode('webp');

                    $filesm = Image::make($file)->fit(100)->encode('webp');


                    // Create hash value
                    $hash = md5($file->__toString());

                    // Prepare qualified image name
                    $image = $hash.".jpg";

                    // Put image to storage
                    // Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                    // Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());
                      $imgData[] = $image;

                  }
              }
              if($request->cover_image) {
                  foreach($request->cover_image as $file)
                  {
                    $name = $file->getClientOriginalName();
                    // Resize image
                    $filelg = Image::make($file)->resize(1200, null, function ($constraint) {
                            $constraint->aspectRatio();
                          })->encode('webp');

                    $filesm = Image::make($file)->resize(100, null, function ($constraint) {
                            $constraint->aspectRatio();
                          })->encode('webp');


                    // Create hash value
                    $hash = md5($file->__toString());

                    // Prepare qualified image name
                    $image = $hash.".jpg";

                    // Put image to storage
                    Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                    Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());
                      $imgData2[] = $image;

                  }
              }

                  $shop = new Shop();
                  // $fileModal->name = json_encode($imgData);
                  $shop->user_id = Auth::user()->id;
                //   $shop->shop_image = json_encode($imgData);
                //   $shop->cover_image = json_encode($imgData2);
                  $shop->name = $request->name;
                  $shop->description = $request->description;
                  $shop->phone = $request->phone;
                  $shop->save();

                  $user = User::find(Auth::user()->id);

                //   Mail::to($user)->send(new ShopActivationRequest($shop));
                  $user1 = User::find(1);
                //   Mail::to($user1)->send(new ShopActivationRequest($shop));
                //   return Redirect::back()->withErrors(['msg', 'The Message']);

                 return view('shop.innactive');


            }



    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function show(Shop $shop)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function edit(Shop $shop)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Shop $shop)
    {
        // $request->validate([
        //     'display_image' => 'required',
        //     'display_image.*' => 'mimes:jpeg,jpg,png,gif,csv,txt,pdf|max:2048',
        //     'cover_image' => 'required',
        //     'cover_image.*' => 'mimes:jpeg,jpg,png,gif,csv,txt,pdf|max:2048',

        //   ]);
            //   dd(User::find(Auth::user()->id)->shop->id);

          if($request->display_image) {
              foreach($request->display_image as $file)
              {

                $name = $file->getClientOriginalName();
                // Resize image
                $filelg = Image::make($file)->fit(600)->encode('webp');

                $filesm = Image::make($file)->fit(100)->encode('webp');


                // Create hash value
                $hash = md5($file->__toString());

                // Prepare qualified image name
                $image = $hash.".jpg";

                // Put image to storage
                Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());

                  $imgData[] = $image;

              }
            }
          if($request->cover_image) {
              foreach($request->cover_image as $file)
              {
                $name = $file->getClientOriginalName();
                // Resize image
                $filelg = Image::make($file)->resize(1200, null, function ($constraint) {
                        $constraint->aspectRatio();
                      })->encode('webp');

                $filesm = Image::make($file)->resize(100, null, function ($constraint) {
                        $constraint->aspectRatio();
                      })->encode('webp');


                // Create hash value
                $hash = md5($file->__toString());

                // Prepare qualified image name
                $image = $hash.".jpg";

                // Put image to storage
                Storage::put("uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                Storage::put("uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());
                  $imgData2[] = $image;

              }
            }


          $shop = Shop::find(User::find(Auth::user()->id)->shop->id);
          // $fileModal->name = json_encode($imgData);
          if($request->display_image){

              $shop->shop_image = json_encode($imgData);
          }
          if($request->cover_image){
              $shop->cover_image = json_encode($imgData2);

          }
          if($request->name){
              $shop->name = $request->name;
          }
          if($request->address){
            $shop->address = $request->address;
          }
          if($request->description){
               $shop->description = $request->description;
          }
          if($request->long){
            $shop->longitude = $request->long;
          }
          if($request->lat){
           $shop->latitude = $request->lat;
          }
          if($request->delete){
            $shop->delete();
            return redirect(route('home.home'));
          }

          $shop->save();

             return back()->with('success', 'Shop has been updated !');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function destroy(Shop $shop)
    {
        //
    }
}
