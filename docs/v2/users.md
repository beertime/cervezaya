## Users

### Creat usuario `POST /users/:id`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
| email | alphanumeric | | si | Email único para cada usuario |
| push_uid | alphanumeric | | no | Push ID para notificaciones Android |
| facebook_uid | alphanumeric | | no | Facebook ID |
| google_uid | alphanumeric | | no | Google ID |
| username | alphanumeric | | no | Username único para cada usuario, no puede contener carácteres extraños |
| publicname | string | | no | Nombre público que muestra el usuario en la app |
| avatar | string | | no | Url de la imagen de avatar externa, normalmente dada por facebook o google |
| custom_avatar | string | | no | Url del avatar que el usuario sube desde la app |
| gender | string | | no | Sexo del usuario, puede ser "male", "female" o "other" |
| birth | date | | no | Fecha de nacimiento del usuario |
| city | string | | no | Ciudad del usuario |
| country | string | ES | no | País del usuario |
| last_connection_date | datetime | Time.now | no | Fecha última actividad del usuario, automáticamente se genera si no se especifica cada vez que el usuario hace POST o PUT |

Resultado:

    Code: 201

    {
        "id": 500,
        "push_uid": null,
        "facebook_uid": "100167416300000",
        "google_uid": null,
        "username": "juanmuestra",
        "email": "user@gmail.com",
        "publicname": "Juan Muestra",
        "avatar": "https://fbcdn-profile-a.akamaihd.net/d04",
        "custom_avatar": null,
        "gender": "male",
        "birth": null,
        "city": null,
        "country": null,
        "last_connection_date": "2015-08-02T08:38:43.544+02:00"
    }

### Creat usuario `PUT /users/:id`

| param | type | default | required | description |
| --- | --- | --- | --- |
| email | alphanumeric | | si | Email único para cada usuario |
| push_uid | alphanumeric | | no | Push ID para notificaciones Android |
| facebook_uid | alphanumeric | | no | Facebook ID |
| google_uid | alphanumeric | | no | Google ID |
| username | alphanumeric | | no | Username único para cada usuario, no puede contener carácteres extraños |
| publicname | string | | no | Nombre público que muestra el usuario en la app |
| avatar | string | | no | Url de la imagen de avatar externa, normalmente dada por facebook o google |
| custom_avatar | string | | no | Url del avatar que el usuario sube desde la app |
| gender | string | | no | Sexo del usuario, puede ser "male", "female" o "other" |
| birth | date | | no | Fecha de nacimiento del usuario |
| city | string | | no | Ciudad del usuario |
| country | string | ES | no | País del usuario |
| last_connection_date | datetime | Time.now | Fecha última actividad del usuario, automáticamente se genera si no se especifica cada vez que el usuario hace POST o PUT |

Resultado:

    Code: 200

    {
        "id": 500,
        "push_uid": null,
        "facebook_uid": "100167416300000",
        "google_uid": null,
        "username": "juanmuestra",
        "email": "user@gmail.com",
        "publicname": "Juan Muestra",
        "avatar": "https://fbcdn-profile-a.akamaihd.net/d04",
        "custom_avatar": null,
        "gender": "male",
        "birth": null,
        "city": null,
        "country": null,
        "last_connection_date": "2015-08-02T08:38:43.544+02:00"
    }

### Detalle de usuario `GET /users/:id`

Resultado:

    Code: 200

    {
        "id": 500,
        "push_uid": null,
        "facebook_uid": "100167416300000",
        "google_uid": null,
        "username": "juanmuestra",
        "email": "user@gmail.com",
        "publicname": "Juan Muestra",
        "avatar": "https://fbcdn-profile-a.akamaihd.net/d04",
        "custom_avatar": null,
        "gender": "male",
        "birth": null,
        "city": null,
        "country": null,
        "last_connection_date": "2015-08-02T08:38:43.544+02:00"
    }

### Borrar usuario `DELETE /users/:id`

Resultado:

    Code: 204
