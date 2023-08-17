<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CommentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('comments')->insert(
            [
                'user_id' => 1 ,
                'post_id' => 1 ,
                'comment' => 'Ajas addf dsddfs dsf s v vsv ffs fser ef asd fasdf.'  ,
                'reply' => true ,

            ]
        );

        DB::table('comments')->insert(
            [
                'user_id' => 2 ,
                'post_id' => 1 ,
                'comment' => 'MIsd addf dsddfs dsf s v vsv ffs fser ef asd fasdf.'  ,
                'reply' => false ,

            ]
        );

        DB::table('comments')->insert(
            [
                'user_id' => 3 ,
                'post_id' => 1 ,
                'comment' => 'Well done sir.'  ,
                'reply' => true ,

            ]
        );

        DB::table('comments')->insert(
            [
                'user_id' => 4 ,
                'post_id' => 1 ,
                'comment' => 'Phenomenal work fasdf.'  ,
                'reply' => true ,
                'reply_to' => 1

            ]
        );

    }
}
