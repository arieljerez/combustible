<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      factory(App\User::class, 1)->create([
        'dni' => '12345678',
        'email' => 'admin@combustibleMobile.deb',
        'password' => bcrypt('123456'),
        'remember_token' => str_random(10),
        'nombre' => 'Eduardo Jerez',
        'rol' => 'Administrador',
        ]);
      factory(App\User::class, 300)->create();
    }
}
