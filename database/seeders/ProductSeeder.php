<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Image;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $json = Storage::disk('local')->get('/app/json/amrodproducts.json');
        $products = json_decode($json, true);

        foreach ($products as $product) {


            $data = new Product();
            $data->shop_id =1;
            $data->name = $product['productName'];
            $data->description = $product['description'];
            $data->full_specs =$product['description'];
            $data->price = 100;
            $data->cover_img = "";
            $data->save();

            // print_r($product['images'] );

            if($product['images']!=null){
                foreach ($product['images'] as $image) {

                    $imageO = new Image();
                    $imageO->url = $image['urls'][0]['url'];
                    $imageO->product_id = $data->id;
                    $imageO->save();

                }
            }else{
                $imageO = new Image();
                $imageO->url = "";
                $imageO->product_id = $data->id;
                $imageO->save();
            }


            foreach ($product['categories'] as $p) {
                $cat = Category::where('description','=' ,$p['code'])->first();
                if($cat!=null){
                    $cat->products()->save($data);
                }
            }
        }

        // Movie::query()->updateOrCreate([
        //     'title' => $movie['title'],
        //     'id_imdb' => $movie['id_imdb']
        // ]);





    }
}
