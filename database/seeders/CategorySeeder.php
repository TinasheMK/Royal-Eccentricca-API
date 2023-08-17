<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $json = Storage::disk('local')->get('/app/json/categories.json');
        $products = json_decode($json, true);

        foreach ($products as $product) {

            $data = new Category();
            $data->name = $product['categoryName'];
            $data->description = $product['categoryCode'];
            $data->featured = true;
            $data->menu = false;
            $data->save();


            foreach ($product['children'] as $prod) {
                $child = new Category();
                $child->name = $product['categoryName'];
                $child->description = $prod['categoryCode'];
                $child->featured = true;
                $child->parent_id = $data->id;
                $child->menu = false;
                $child->save();

                foreach ($prod['children'] as $p) {
                    $grandchild = new Category();
                    $grandchild->name = $p['categoryName'];
                    $grandchild->description = $p['categoryCode'];
                    $grandchild->featured = true;
                    $grandchild->parent_id = $child->id;
                    $grandchild->menu = false;
                    $grandchild->save();

                }

            }

        }

    }
}
