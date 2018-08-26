<form method="get" action="{{url('cuentacorriente',$id)}}">
  <div class="row">

    <div class="input-group-append col-md-4">
        <select id="buscarpor" name="buscarpor" class="custom-select" data-style="btn-primary">
          <option value="" {{ request('buscarpor') == '' ? ' selected': ''}}> Filtrar por </option>
          <option value="origen" {{ request('buscarpor') == 'origen' ? ' selected': ''}}> Origen </option>
          <option value="destino" {{ request('buscarpor') == 'destino' ? ' selected': ''}}> Destino </option>
        </select>
        <input type="text" id="buscar" name="buscar" class="form-control" placeholder="Buscar" value="{{ request('buscar')}}" />
    </div>

    <div class="input-group-append col-md-3 mb-3">
      @component('components.combo_paginacion')
      @endcomponent
    </div>

  </div>
  <div class="row">
    <div class="col-md-4">
        <button type="submit" class="btn btn-info"> <i class="fas fa-search"></i> Buscar</button>
        <a href="{{ url('cuentacorriente',$id) }}" class="btn btn-info"> <i class="fas fa-eraser"></i> Limpiar</a>
    </div>
  </div>
</form>
