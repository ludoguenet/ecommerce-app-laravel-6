<?php

use App\Category;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $created_at = (Carbon::now())->toDateTimeString();

        Category::create([
            'name' => 'High-Tech',
            'slug' => 'high-tech',
            'created_at' => $created_at
        ]);

        Category::create([
            'name' => 'Mode',
            'slug' => 'mode',
            'created_at' => $created_at
        ]);

        Category::create([
            'name' => 'Épiceries',
            'slug' => 'epiceries',
            'created_at' => $created_at
        ]);

        Category::create([
            'name' => 'Livres',
            'slug' => 'livres',
            'created_at' => $created_at
        ]);

        Category::create([
            'name' => 'Jeux',
            'slug' => 'jeux',
            'created_at' => $created_at
        ]);
    }
}
