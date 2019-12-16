# Api Base

### Descripción 
- Api base para comenzar desarrollo.

### Características
- Registro de usuarios(Autenticación) mediante JWT
- Autorización mediante la gema Cancancan
- Avatar de usuario mediante la gema Carrierwave (Imagen por defecto para cada usuario)
- Versionamiento mediante Concerns en routing
- Prevención de requests masivas mediante la gema rack-attack

### Usuario Admin por defecto
- email: admin@domain.com
- password: admin123

### Endpoints
- Registro 
```bash
api/v1/sign_up
```
- Autenticación
```bash
api/v1/sign_in
```
- Usuario actual
```bash
api/v1/auth
```
- Usuarios (Solo administrador puede ver este endpoint)
```bash
api/v1/admin/users
```
- Eliminar/Editar/Ver Usuario (Requiere token)
```bash
v1/users/USERNAME
```
### Ejemplos

- Registro de usuario (devuelve token asi evitar enviar 2 request para obtener token al registrarse)
```bash
curl -H 'Content-Type: application/json' -d '{"user": {"email": "emaildomain.com","password": "password","password_confirmation":"password", "username":"user_example"}}' localhost:3000/api/v1/sign_up
```

- Autenticación de usuario (devuelve token)
```bash
curl -H 'Content-Type: application/json' -d '{"auth": {"email": "email@domain.com","password": "password"}}' localhost:3000/api/v1/sign_in
```

- Usuario actual (devuelve username actual)
```bash
curl -H 'Content-Type: application/json' -H 'Authorization: JWT' localhost:3000/api/v1/auth
```

- Subir/Editar avatar usuario
```bash
curl -X PATCH -v -H 'Content-Type: multipart/form-data' -H 'Accept: application/json' -H 'Authorization: JWT' -F "user[avatar]=@/PATH_FILE" localhost:3000/api/v1/users/USERNAME
```

- Editar usuario
- Campos : email, username, etc..
- Para actualizar la contraseña se requiere de los campos:
- current_password, password, password_confirmation
```bash
curl -X PATCH -H 'Content-Type: application/json' -H 'Authorization: JWT' -d '{"user": {"email":"email@domain.com"}}' localhost:3000/api/v1/users/USERNAME
```

- Eliminar usuario
* Posibilidad de dar cuenta de baja (Administrador puede eliminar cualquier usuario)
```bash
curl -X DELETE -H 'Content-Type: application/json' -H 'Authorization: JWT' localhost:3000/api/v1/users/USERNAME
```

- Ver usuario en particular
```bash
curl -H 'Content-Type: application/json' -H 'Authorization: JWT' localhost:3000/api/v1/users/USERNAME
```

 - Listar usuarios
 - Solo el usuario con rol "admin" puede modificar/eliminar a otros usuarios además de listarlos.
 ```bash
 curl -H 'Content-Type: application/json' -H 'Authorization: JWT' localhost:3000/api/v1/admin/users
 ```
 
### Instalación
```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```
