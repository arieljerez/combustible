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
    return redirect('login');
});

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware' => 'auth'], function () {

  Route::group(['middleware' => 'admin'], function () {
    Route::resource('usuarios', 'UsuarioController');
    Route::resource('estaciones', 'EstacionController');
    Route::resource('cuentacorriente', 'CuentaCorrienteController');
    Route::resource('reportes', 'ReporteController');
    Route::get('cuentacorriente/transferir/{id}', 'CuentaCorrienteController@transferir');
    Route::get('cuentacorriente/iniciar/{id}', 'CuentaCorrienteController@iniciar');
    Route::get('cuentacorriente/depositar/{id}', 'CuentaCorrienteController@depositar');
    Route::get('cuentacorriente/extraer/{id}', 'CuentaCorrienteController@extraer');
  });
    Route::group(['middleware' => ['expendedor']], function () {
      Route::resource('consumo', 'ConsumoController');
      Route::get('consumo/ingresar/{id}', 'ConsumoController@ingresar');
      Route::post('consumo/validar/{id}', 'ConsumoController@validar');
      Route::get('consumo/verificarusuario/{id}/{monto}', 'ConsumoController@verificarusuario');
      Route::post('consumo/grabar/{id}/{monto}', 'ConsumoController@grabar');
    });
});
