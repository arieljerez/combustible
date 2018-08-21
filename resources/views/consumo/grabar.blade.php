@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">¡Consumo registrado con exito!</div>

                <div class="card-body">

                    <div class="row justify-content-center">
                      <div class="col-md-8">
                        <label for="consumidor">Consumidor:</label>
                        <label class="form-control" id="consumidor">{{ $id }}</label>
                      </div>
                    </div>

                    <div class="row justify-content-center">
                      <div class="col-md-8">
                        <label for="monto">Monto Consumido:</label>
                        <label class="form-control" id="monto">{{ $monto }}</label>
                      </div>
                    </div>

                    <div class="row justify-content-center">
                      <div class="col-md-8">
                          &nbsp;
                      </div>
                    </div>

                    <div class="row justify-content-center">
                      <div class="col-md-8">
                          <a href="{{ url('consumo') }}" type="button" class="btn btn-primary">
                            <i class="fas fa-back"></i> {{ __('Volver') }}
                          </a>
                      </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
