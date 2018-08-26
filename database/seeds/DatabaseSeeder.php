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
        $estacion = App\Estacion::create([
          'codigo' => 'EST01',
          'nombre' => 'YPF'
        ]);
        $this->call(UsersTableSeeder::class);
        $this->call(CuentaCorrienteTableSeeder::class);
    }
}
