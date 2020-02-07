<?php

use App\Product;
use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();

        for ($i=0; $i < 30; $i++) {
            Product::create([
                'title' => $faker->sentence(4),
                'slug' => $faker->slug,
                'subtitle' => $faker->sentence(5),
                'description' => $faker->text,
                'price' => $faker->numberBetween(15, 300) * 100,
                'image' => 'https://via.placeholder.com/200x250'
            ])->categories()->attach([
                rand(1, 4),
                rand(1, 4)
            ]);
        }
    }
}
