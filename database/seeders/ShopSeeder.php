<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ShopSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('shops')->insert(
            [
            'name'=> 'Shop2',
            'user_id'=> '1',
            'is_active'=> true,
            'phone'=>34
             ]
        );

    }
}
