<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MessageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('messages')->insert(
            [
            'user_id'       => 1 ,
            'body'          =>'Shoe sjsa sad sas ada c',
            'reply'    =>true,
            ],

        );
        DB::table('messages')->insert(
            [
            'user_id'       => 31 ,
            'body'          =>'Ok c',
            'reply'    =>false,
            ],

        );
        DB::table('messages')->insert(
            [
            'user_id'       => 1 ,
            'body'          =>'Hiew ad sas ada c',
            'reply'    =>true,
            ],

        );
    }
}
