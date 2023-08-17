<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('posts')->insert(
            [


            'caption' => 'I love Macklemore. Man we had a good time yesterday.',
            'title' => 'Iibes any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Harare' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'Bla bla re. Man we had a good time yesterday.',
            'title' => 'Meep any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Waterfalls' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'I love Macklemore. Man we had a good time yesterday.',
            'title' => 'Iibes any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Harare' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'Bla bla re. Man we had a good time yesterday.',
            'title' => 'Meep any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Waterfalls' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'I love Macklemore. Man we had a good time yesterday.',
            'title' => 'Iibes any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Harare' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'Bla bla re. Man we had a good time yesterday.',
            'title' => 'Meep any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Waterfalls' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'I love Macklemore. Man we had a good time yesterday.',
            'title' => 'Iibes any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Harare' ,
            'shop_id' => 1,
             ]
        );
        DB::table('posts')->insert(
            [


            'caption' => 'Bla bla re. Man we had a good time yesterday.',
            'title' => 'Meep any day',
            'media_link'=> '["14.jpg"]',
            'location'  => 'Waterfalls' ,
            'shop_id' => 1,
             ]
        );
    }
}
