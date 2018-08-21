<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::resource('usuarios', 'UsuarioController');
Route::resource('carga', 'CargaController');
Route::resource('consumo', 'ConsumoController');
Route::get('consumo/ingresar/{id}', 'ConsumoController@ingresar');
Route::post('consumo/validar/{id}', 'ConsumoController@validar');
Route::get('consumo/verificarusuario/{id}/{monto}', 'ConsumoController@verificarusuario');
Route::post('consumo/grabar/{id}/{monto}', 'ConsumoController@grabar');
