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
