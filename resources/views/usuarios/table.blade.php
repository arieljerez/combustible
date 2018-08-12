<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="card card-default">
              <div class="card-header">Usuarios</div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <a href="url('usuarios/create')" class="btn btn-primary">+ Nuevo Usuario</a>
                  </div>
                </div>
                <form method="get" action="{{url('usuarios')}}">
                  <div class="row">
                    <div class="col-md-3 mb-3">
                        <input type="text" id="dni" name="dni" class="form-control" placeholder="DNI" />
                    </div>
                    <div class="col-md-3 mb-3">
                        <input type="text" id="email" name="email" class="form-control" placeholder="Email"/>
                    </div>
                    <div class="col-md-3 mb-3">
                        <select id="email" name="rol" class="form-control" >
                          <option value=""> Roles </option>
                          <option value="1"> Administrador </option>
                          <option value="2"> Conductor </option>
                          <option value="3"> Playero </option>
                        </select>
                    </div>
                    <div class="col-md-3 mb-3">
                        <button type="submit" class="btn btn-info"> <i class="fas fa-search"></i> Buscar</button>
                    </div>
                  </div>
                </form>
                <div class="table-responsive">
                  <table class="table table-striped table-condensed">
                    <thead>
                        <th>DNI</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>
                        @foreach( $usuarios as $usuario)
                          <tr>
                              <td>{{ $usuario->dni }}</td>
                              <td>{{ $usuario->email }}</td>
                              <td>{{ $usuario->role_id }}$$$$$$$$$$$$$$$S</td>
                              <td>
                                  <action-icons url="{{ url('usuarios') }}" :id="{{ $usuario->id }}" token="{{ csrf_token() }}"></action-icons>
                              </td>
                          </tr>
                        @endforeach
                    </tbody>
                  </table>
                </div>

                {{ $usuarios->links() }}
              </div>
          </div>


        </div>
    </div>
</div>
