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
        'es_cuenta_principal' => false,
        'cuenta_principal_id' => null,
        ]);

      factory(App\User::class, 20)->create([
        'es_cuenta_principal' => true,
        'cuenta_principal_id' => null,
      ])
      ->each(function ($u) {
        $rand =  rand ( 3, 15 );
        for ($i=0;$i < $rand ;$i++){
          factory(App\User::class)->create([
            'cuenta_principal_id' => $u->id,
            'es_cuenta_principal' => false,
          ]);
        }
      });
    }
}
