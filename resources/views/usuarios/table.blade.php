<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="card card-default">
              <div class="card-header">Usuarios</div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <a href="{{url('usuarios/create')}}" class="btn btn-primary"><i class="fas fa-plus"></i> Nuevo Usuario</a>
                  </div>
                </div>

                @include('usuarios.filters')

                @if( $usuarios->count() > 0)
                <div class="row">
                  <div class="col-md-4 mb-4">
                    Encontrados: {{$usuarios->count()}} de {{$usuarios->total()}}
                  </div>
                </div>

                <div class="table-responsive">
                  <table class="table table-striped table-condensed">
                    <thead>
                        <th>DNI</th>
                        <th>Nombre</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </thead>
                    <tbody>
                        @foreach( $usuarios as $usuario)
                          <tr>
                              <td>
                                <p class="h4">{{ $usuario->dni }}</p>
                                <small>Registro: {{ $usuario->created_at->format('d/m/Y') }}</small>
                              </td>
                              <td>{{ $usuario->nombre }}
                                <p>
                                  <small>{{ $usuario->email }}</small>
                                </p></td>
                              <td>{{ $usuario->rol }}</td>
                              <td>
                                  <action-icons url="{{ url('usuarios') }}" :id="{{ $usuario->id }}" token="{{ csrf_token() }}"></action-icons>
                              </td>
                          </tr>
                        @endforeach
                    </tbody>
                  </table>
                </div>

                {{ $usuarios->links() }}
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
