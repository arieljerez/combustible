<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\DB as DB;
use App\CuentaCorriente;

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
      $usuario =  User::where('id',$id)->first();
      return view('consumo.ingresar',compact('usuario'));
    }

    public function validar($id){
      $monto = request('monto');

      $data = request()->validate([
        'monto' => 'required|min:1'
      ]);

      $cuenta_principal_id =  User::where('id',$id)->value('cuenta_principal_id');

      $linea = \DB::table('cuenta_corriente')
                      //  ->select(\Illuminate\Support\Facades\DB::raw('max(linea) as linea'))
                        ->groupby('usuario_id')
                        ->where('usuario_id','=',$cuenta_principal_id)
                        ->value(DB::raw('max(linea) as linea'));
      $saldo = DB::table('cuenta_corriente')
                              ->where('usuario_id','=',$cuenta_principal_id)
                              ->where('linea',$linea)
                              ->value('saldo');

      if (($saldo - $monto) < 0){
          return back()->withErrors(['saldo'=> 'Saldo Insuficiente:  ($'. $saldo.')']);
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
      $user = User::find($id);
      if (!\Hash::check($pin, $user->password)) {
          return back()->withErrors(['pin' => 'PIN incorrecto']);
      }
      /*
        if (\Auth::attempt(['id' => $id, 'password' => $pin])) {
          return back()->withErrors(['pin' => 'PIN incorrecto']);
        }
      */
      $cuenta_principal_id =  User::where('id',$id)->value('cuenta_principal_id');
      // grabar Consumo
      //
      $cuenta_principal= DB::table('cuenta_corriente')->where('usuario_id',$cuenta_principal_id)
          ->latest()
          ->first();

      $datos['saldo'] =  $cuenta_principal->saldo - $monto;
      \Validator::make($datos, [
          'saldo' => [
              'numeric',
              'min:0',
          ],
      ],
      [
        'saldo.min' => 'Saldo insuficiente:  ($'. $datos['saldo'].')'
      ])->validate();

      $estacion_id = 1;
      $estacion = DB::table('estaciones')->where('id',$estacion_id)->value('nombre');
      $consumidor = DB::table('usuarios')->where('id',$id)->value('nombre');


      $cc = CuentaCorriente::Create([
        'usuario_id' => $cuenta_principal->usuario_id,
        'linea' => $cuenta_principal->linea + 1,
        'tipo_movimiento' => 'consumo',
        'saldo' => $cuenta_principal->saldo - $monto,
        'monto' => $monto * -1,
        'audi_usuario_id' => \Auth::id(),
        'usuario_id_consumidor' => $id,
        'estacion_id' => $estacion_id,
        'comentarios' => 'Consumo Estacion: '. $estacion. ' por '. $consumidor
      ]);
      $expendedor = \Auth::user()->nombre;
      $fecha = $cc->created_at;


      $datos = compact(['consumidor','monto','estacion','fecha','expendedor']);

      return redirect('consumo/registrado')->with('datos',$datos);

    }

    public function show()
    {
        if(empty(session('datos'))){
          return redirect('consumo');
        }
        $datos = session('datos');
        $consumidor = $datos['consumidor'];
        $monto = $datos['monto'];
        $estacion = $datos['estacion'];
        $fecha = $datos['fecha'];
        $expendedor = $datos['expendedor'];
        return view('consumo.grabar',compact(['consumidor','monto','estacion','fecha','expendedor']));
    }


}
