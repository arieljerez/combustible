<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCuentaCorrienteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cuenta_corriente', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('conductor_id')->unsigned();
            $table->integer('linea')->unsigned()->default(1);
            $table->integer('conductor_id_destino')->unsigned();
            $table->integer('conductor_id_origen')->unsigned();
            $table->integer('playero_id')->unsigned()->nulleable();
            $table->integer('estacion_id')->unsigned()->nulleable();
            $table->enum('tipo_movimiento',['transferencia','consumo','deposito']);
            $table->double('saldo', 8, 2)->default(0);
            $table->double('monto', 8, 2)->default(0);
            $table->integer('usuario_id')->unsigned();
            $table->timestamps();

            $table->index('conductor_id');
            $table->index('conductor_id','linea');

            $table->foreign('conductor_id')->references('id')->on('conductores');
            $table->foreign('usuario_id')->references('id')->on('usuarios');
            $table->foreign('playero_id')->references('id')->on('playeros');
            $table->foreign('conductor_id_destino')->references('id')->on('conductores');
            $table->foreign('conductor_id_origen')->references('id')->on('conductores');
        });
    }

    /**
     * Reverse the migrations.wdada
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cuenta_corriente');
    }
}
