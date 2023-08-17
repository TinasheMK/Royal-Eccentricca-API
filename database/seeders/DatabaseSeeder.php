<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::factory(10)->create();

        $this->call([
            ShopSeeder::class,
            CategorySeeder::class,
            ProductSeeder::class,
            // PostSeeder::class,
            // CommentSeeder::class,
            // MessageSeeder::class,
        ]);


    }
}

