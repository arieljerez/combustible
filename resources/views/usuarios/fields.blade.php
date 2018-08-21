<div class="form-group row">
    <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('DNI') }}</label>

    <div class="col-md-6">
        <input id="dni" type="text" class="form-control{{ $errors->has('dni') ? ' is-invalid' : '' }}" name="dni" value="{{ old('dni',$usuario->dni) }}" required autofocus>

        @if ($errors->has('dni'))
            <span class="invalid-feedback" role="alert">
                <strong>{{ $errors->first('dni') }}</strong>
            </span>
        @endif
    </div>
</div>

<div class="form-group row">
    <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Nombre') }}</label>

    <div class="col-md-6">
        <input id="dni" type="text" class="form-control{{ $errors->has('nombre') ? ' is-invalid' : '' }}" name="nombre" value="{{ old('nombre',$usuario->nombre) }}" required autofocus>

        @if ($errors->has('nombre'))
            <span class="invalid-feedback" role="alert">
                <strong>{{ $errors->first('nombre') }}</strong>
            </span>
        @endif
    </div>
</div>

<div class="form-group row">
    <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Rol') }}</label>

    <div class="col-md-6">
        <select id="rol" name="rol" class="form-control{{ $errors->has('rol') ? ' is-invalid' : '' }}">
          <option value="" {{ old('rol',$usuario->rol)  == '' ? ' selected': ''}}> Roles </option>
          <option value="administrador" {{ old('rol',$usuario->rol)  == 'administrador' ? ' selected': ''}}> Administrador </option>
          <option value="usuario" {{ old('rol',$usuario->rol)  == 'usuario' ? ' selected': ''}}> Usuario </option>
          <option value="playero" {{ old('rol',$usuario->rol)  == 'playero' ? ' selected': ''}}> Playero </option>
        </select>

        @if ($errors->has('rol'))
            <span class="invalid-feedback" role="alert">
                <strong>{{ $errors->first('rol') }}</strong>
            </span>
        @endif
    </div>
</div>


<div class="form-group row">
    <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

    <div class="col-md-6">
        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email',$usuario->email) }}" required>

        @if ($errors->has('email'))
            <span class="invalid-feedback" role="alert">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
    </div>
</div>
