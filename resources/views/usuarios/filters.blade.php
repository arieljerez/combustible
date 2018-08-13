<form method="get" action="{{url('usuarios')}}">
  <div class="row">

    <div class="input-group-append col-md-3 mb-3">
        <select id="buscarpor" name="buscarpor" class="custom-select" data-style="btn-primary">
          <option value="" {{ request('buscarpor') == '' ? ' selected': ''}}> Buscar por </option>
          <option value="dni" {{ request('buscarpor') == 'dni' ? ' selected': ''}}> DNI </option>
          <option value="email" {{ request('buscarpor') == 'email' ? ' selected': ''}}> Email </option>
        </select>
        <input type="text" id="buscar" name="buscar" class="form-control" placeholder="Buscar" value="{{ request('buscar')}}" />
    </div>

    <div class="col-md-2 mb-2">
        <select id="rol" name="rol" class="custom-select d-block w-100" >
          <option value="" {{ request('rol') == '' ? ' selected': ''}}> Roles </option>
          <option value="1" {{ request('rol') == 1 ? ' selected': ''}}> Administrador </option>
          <option value="4" {{ request('rol') == 4 ? ' selected': ''}}> Adm.Cuentas </option>
          <option value="2" {{ request('rol') == 2 ? ' selected': ''}}> Conductor </option>
          <option value="3" {{ request('rol') == 3 ? ' selected': ''}}> Playero </option>
        </select>
    </div>

    <div class="input-group-append col-md-3 mb-3">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <span class="fas fa-sort"></span>
          </div>
        </div>

        <select id="ordenarpor" name="ordenarpor" class="form-control">
          <option value=""> Ordenar por </option>
          <option value="dni" {{ request('ordenarpor') == 'dni' ? ' selected': ''}}> DNI </option>
          <option value="email" {{ request('ordenarpor') == 'email' ? ' selected': ''}}> Email </option>
          <option value="created_at" {{ request('ordenarpor') == 'created_at' ? ' selected': ''}}> Registro </option>
        </select>
    </div>

    <div class="input-group-append col-md-2 mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fab fa-page4"></i>
          </div>
        </div>
        <select id="paginacion" name="paginacion" class="custom-select">
          <option value=""> Resultados </option>
          @for ($i = 1; $i < 6; $i++)
              <option value="{{ ($i * 10) }}" {{ request('paginacion') == ($i * 10) ? ' selected': '' }}> {{ $i * 10 }} </option>
          @endfor
          <option value="100" {{ request('paginacion') == '100' ? ' selected': '' }}> 100 </option>
        </select>
    </div>

    <div class="col-md-1 mb-1">
        <button type="submit" class="btn btn-info"> <i class="fas fa-search"></i> Buscar</button>
    </div>
    <div class="col-md-1 mb-1">
        <a href="{{ url('usuarios') }}" class="btn btn-info"> <i class="fas fa-eraser"></i> Limpiar</a>
    </div>
  </div>
</form>
