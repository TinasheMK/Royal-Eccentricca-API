<?php

namespace Database\Factories;

use App\Models\Post;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Post::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [

            // 'caption' => $this->faker->sentence(20),
            // 'media_link'=>$this->faker->sentence(3),
            // 'location'  =>$this->faker->sentence(3) ,
            // 'shop_id' => 1, // password
        ];
    }
}
