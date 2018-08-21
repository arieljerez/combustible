<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class ConsumoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if( request('dni')){
            // validar DNI
          $data = request()->validate([
            'dni' => 'required|integer|digits:8',
          ]);

          $usuario =  User::where('dni', request('dni'))->first();
          if($usuario){
            return redirect('consumo/ingresar/'.$usuario->id);
          }
        }
        return view('consumo.index');
    }

    public function ingresar($id){
      $usuario =  User::findOrFail($id);
      return view('consumo.ingresar',compact('usuario'));
    }

    public function validar($id){
      $monto = request('monto');

      $data = request()->validate([
        'monto' => 'required|min:1'
      ]);

      $saldo = 400 - $data['monto'];
      if ($saldo < 0){
          return back()->withErrors(['saldo'=> 'Saldo Insuficiente']);
      }

      return redirect()->action(
        'ConsumoController@verificarusuario', ['id' => $id, 'monto' => $monto]
      );
    }

    public function verificarusuario($id,$monto)
    {
      return view('consumo.verificarusuario',compact(['id','monto']));
    }

    public function grabar($id,$monto)
    {
      $pin = request('pin');
      if ($pin != '1234'){
        return back()->withErrors(['pin' => 'PIN incorrecto']);
      }
      return view('consumo.grabar',compact(['id','monto']));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }
}
