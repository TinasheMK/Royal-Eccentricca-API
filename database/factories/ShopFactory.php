<?php

namespace Database\Factories;

use App\Models\Shop;
use Illuminate\Database\Eloquent\Factories\Factory;

class ShopFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Shop::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [

            'shop_id'       =>1,
            'name'          =>$this->faker->sentence(2),
            'description'    =>$this->faker->sentence(20),
            'price'         =>$this->faker->numberBetween(20,100),
            'cover_img'      =>$this->faker->sentence(1),
            //
        ];
    }
}
