<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
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
    public function store(Request $request)
    {
        $request->validate([
          'image' => 'required',
          'image.*' => 'mimes:jpeg,jpg,png,gif,csv,txt,pdf|max:20048'
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
                $image = $hash."jpg";

                // Put image to storage
                Storage::put("storage/uploads/".Auth::user()->id."/{$image}", $filelg->__toString());
                Storage::put("storage/uploads/".Auth::user()->id."/cache"."/{$image}", $filesm->__toString());

                // $file->put(public_path().'/uploads/'.Auth::user()->id, $name);
                $imgData[] = $image;

            }


            $post = new Post();
            // $fileModal->name = json_encode($imgData);
            $post->media_link = json_encode($imgData);
            $post->title = $request->title;
            $post->shop_id = User::find(Auth::user()->id)->shop->id;
            $post->caption = $request->caption;
            $post->location = "Kamusika";

            $post->save();

           return back()->with('success', 'Post published!');
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //
        // $product = Product::find();

        $post->delete();
        return back()->with('success', 'Post has been deleted!');

    }
}
