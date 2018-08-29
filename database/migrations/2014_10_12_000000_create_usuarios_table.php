<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->increments('id');
            $table->string('dni')->unique();
            $table->string('email')->unique();
            $table->string('password');
            $table->enum('rol',['administrador','usuario','expendedor','cuenta_principal']);
            $table->string('nombre',200);
            $table->string('comentarios',200)->nulleable('');
            $table->integer('cuenta_principal_id')->nulleable()->unsigned();
            $table->boolean('es_cuenta_principal')->default(false);
            $table->unsignedinteger('estacion_id')->default(null)->nulleable();
            $table->rememberToken();
            $table->timestamps();
        });

        DB::statement('ALTER TABLE `usuarios`	ALTER `cuenta_principal_id` DROP DEFAULT;');
        DB::statement('ALTER TABLE `usuarios`
          CHANGE COLUMN `cuenta_principal_id` `cuenta_principal_id` INT(10) UNSIGNED NULL AFTER `comentarios`;');
        DB::statement('ALTER TABLE `usuarios`
            CHANGE COLUMN `estacion_id` `estacion_id` INT(10) UNSIGNED NULL AFTER `es_cuenta_principal`;');

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}
