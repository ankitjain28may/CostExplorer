<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Eloquent::unguard();

        $this->command->info('Seeding data from Schema.sql file!');
        $path = __DIR__ . '/../schema.sql';
        DB::unprepared(file_get_contents($path));
    }
}
