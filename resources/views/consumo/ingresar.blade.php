@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Registro Consumo. Paso 2/3</div>

                <div class="card-body">

                  @isset($usuario)
                  <form method="post" action="{{ url('consumo/validar',$usuario->id) }}" aria-label="{{ __('validar') }}">
                    @csrf
                    <div class="row justify-content-center">
                      <div class="col-md-8" >

                        <h4>{{ $usuario->nombre }}</h4>
                        <h5>Dni: {{ $usuario->dni }}</h5>
                      </div>
                    </div>
                    <div class="row justify-content-center">
                      <label for="monto">Monto Consumido:</label>
                    </div>
                    <div class="row justify-content-center">

                      <div class="input-group-append col-md-8">
                        <div class="input-group-prepend">
                          <div class="input-group-text">
                            $
                          </div>
                        </div>
                        <input type="number" min="0" step=".01" name="monto" id="monto" class="form-control{{ $errors->has('saldo') ? ' is-invalid' : '' }}" value="{{ old('monto') }}" required>
                      </div>
                    </div>
                    <div class="row justify-content-center">
                      <div class="col-md-6">
                        @if ($errors->has('saldo'))
                            <strong class="text-danger font-weight-bold">{{ $errors->first('saldo') }}</strong>
                        @endif
                      </div>
                    </div>

                    <div class="row justify-content-center">
                      <div class="col-md-8">
                          &nbsp;
                      </div>
                    </div>
                    <div class="row justify-content-center">
                      <div class="col-md-8">
                          <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> {{ __('Continuar') }}
                          </button>
                      </div>
                    </div>
                  </form>
                  @endisset
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
