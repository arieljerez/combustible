@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="card card-default">
            @foreach( $cuenta as $c)
              <div class="card-header">
                <div class="row">
                  <div class="col-md-4 mb-3">Cuenta Corriente: <h5>{{ $c->nombre }} </h5>  </div>
                  <div class="col-md-4 mb-3">Saldo: <h5>${{$c->saldo}}</h5> </div>
                  <div class="col-md-4 mb-3">Líneas: <h5>{{ $c->lineas }}</h5> </div>
                </div>
              </div>
            @endforeach
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <a href="{{url('cuentacorriente')}}" class="btn btn-primary"><i class="far fa-arrow-alt-circle-left"></i> Volver</a>
                  </div>
                </div>

            @include('cuentacorriente.filters_detalle')

                @if( $lineas->count() > 0)
                <div class="row">
                  <div class="col-md-4 mb-4">
                    Encontrados: {{ $lineas->count() }} de {{$lineas->total()}}
                  </div>
                </div>

                <div class="table-responsive">
                  <table class="table table-striped table-condensed">
                    <thead>
                        <th>Linea</th>
                        <th>Origen</th>
                        <th>Destino</th>
                        <th>Tipo Movimiento</th>
                        <th>Saldo</th>
                        <th>Monto</th>

                    </thead>
                    <tbody>
                        @foreach( $lineas as $linea)
                          <tr>
                              <td>
                                <p class="h4">{{ $linea->linea }}</p>
                                <small>{{ $linea->comentarios }}</small>
                              </td>
                              <td>
                                @empty ($linea->origen )
                                   {{ $linea->origen }}
                                @else
                                  <a href="{{ url('cuentacorriente',$linea->origen_id) }}"> {{ $linea->origen }}</a>
                                @endempty
                              </td>
                              <td>
                                @empty ($linea->destino )
                                   {{ $linea->destino }}
                                @else
                                  <a href="{{ url('cuentacorriente', $linea->destino_id ) }}"> {{ $linea->destino }}</a>
                                @endempty
                              </td>
                              <td>{{ $linea->tipo_movimiento }}</td>
                              <td>${{ $linea->saldo }}</td>
                              <td>${{ $linea->monto }}</td>
                          </tr>
                        @endforeach
                    </tbody>
                  </table>
                </div>

                {{ $lineas->links() }}
                @else
                <div class="row">
                  <div class="col-md-3 mb-3">
                    No se encontraron resultados
                  </div>
                </div>
                @endif
              </div>
          </div>

        </div>
    </div>
</div>

@endsection
