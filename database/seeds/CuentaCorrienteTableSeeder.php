<?php

use Illuminate\Database\Seeder;

class CuentaCorrienteTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


        $estacion = DB::table('estaciones')->inRandomOrder()->first();

        $cuentas = App\User::where('es_cuenta_principal',true)->get();

// deposito inicial
        foreach ($cuentas as $cuenta) {
            App\CuentaCorriente::create([
              'usuario_id' => $cuenta->id,
              'linea' => 1,
              'usuario_id_destino' => null,
              'usuario_id_origen' => null,
              'estacion_id' => null,
              'comentarios' => 'Deposito Inicial',
              'tipo_movimiento' => 'deposito',
              'saldo' => 20000,
              'monto'=> 20000,
              'audi_usuario_id' => 1
            ]);
        }
// consumo
        $cuentas = App\User::where('es_cuenta_principal',true)->get();

        foreach ($cuentas as $cuenta) {

          $cuenta_saldo = DB::table('cuenta_corriente')->where('usuario_id',$cuenta->id)
              ->latest()
              ->value('saldo');

            App\CuentaCorriente::create([
              'usuario_id' => $cuenta->id,
              'linea' => 2,
              'usuario_id_destino' => null,
              'usuario_id_origen' => null,
              'estacion_id' => $estacion->id,
              'comentarios' => 'Consumo Estacion: '. $estacion->nombre,
              'tipo_movimiento' => 'consumo',
              'saldo' => $cuenta_saldo - 2000,
              'monto'=> -2000,
              'audi_usuario_id' => 1,
              'usuario_id_consumidor' =>  DB::table('usuarios')->where('rol','usuario')->inRandomOrder()->value('id')
            ]);
        }
//transferencia
        $cuentas = App\User::where('es_cuenta_principal',true)->get();

        foreach ($cuentas as $cuenta) {
            $cuenta_destino = DB::table('usuarios')
                ->where([
                  ['es_cuenta_principal','=','usuario'],
                  ['es_cuenta_principal','=',false]
                ])
                ->inRandomOrder()->first();
            $cuenta_destino_saldo = DB::table('cuenta_corriente')->where('usuario_id',$cuenta_destino->id)
                ->latest()
                ->value('saldo');
            $cuenta_origen_saldo = DB::table('cuenta_corriente')->where('usuario_id',$cuenta->id)
                    ->latest()
                    ->value('saldo');
          // egreso
            App\CuentaCorriente::create([
              'usuario_id' => $cuenta->id,
              'linea' => 3,
              'usuario_id_destino' => $cuenta_destino->id,
              'usuario_id_origen' => null,
              'estacion_id' => null,
              'comentarios' => 'Por Transferencia a : '. $cuenta_destino->nombre,
              'tipo_movimiento' => 'transferencia',
              'saldo' => $cuenta_origen_saldo - 4000,
              'monto'=> -4000,
              'audi_usuario_id' => 1,
              'usuario_id_consumidor' =>  null
            ]);
          //ingreso
            App\CuentaCorriente::create([
              'usuario_id' => $cuenta_destino->id,
              'linea' => 3,
              'usuario_id_destino' => null,
              'usuario_id_origen' => $cuenta->id,
              'estacion_id' => null,
              'comentarios' => 'Por Transferencia de : '. $cuenta->nombre,
              'tipo_movimiento' => 'transferencia',
              'saldo' => $cuenta_destino_saldo + 4000,
              'monto'=> 4000,
              'audi_usuario_id' => 1,
              'usuario_id_consumidor' =>  null
            ]);
        }

        /*
        $table->integer('usuario_id')->unsigned();
        $table->integer('linea')->unsigned()->default(1);
        $table->integer('usuario_id_destino')->nulleable()->unsigned();
        $table->integer('usuario_id_origen')->nulleable()->unsigned();
        $table->integer('estacion_id')->unsigned()->nulleable();
        $table->string('comentarios',200)->default('');
        $table->enum('tipo_movimiento',['transferencia','consumo','deposito','extraccion']);
        $table->double('saldo', 8, 2)->default(0);
        $table->double('monto', 8, 2)->default(0);
        $table->integer('audi_usuario_id')->unsigned();
         */

    }
}
