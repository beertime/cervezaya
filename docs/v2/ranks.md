## Bares valorados de usuario (Historial)

### Crear valoración de bar por usuario `POST /users/:user_id/ranks`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
| bar_id | number | | si | ID del bar |
| value | number | 0 | si | Valoración entre el 1 y 10 |

Resultado:

    Code: 201

    {
        "id": 252,
        "value": 5,
        "bar": {
            "id": 844,
            "name": "De Cañas",
            "description": "",
            "address": "Av. de Eduardo Dato,  99",
            "region": "Sevilla",
            "phone": "619524842",
            "rank": null,
            "latitude": 37.3815671,
            "longitude": -5.96712990000003,
            "photo": "De-Ca_as.jpg",
            "products": [
                {
                    "id": 2982,
                    "price": "1.1",
                    "size": {
                        "id": 1,
                        "name": "Caña",
                        "icon": 1,
                        "volume": 20
                    },
                    "brand": {
                        "id": 11,
                        "name": "Cruzcampo",
                        "color": "#e1061c",
                        "image": "CruzcampoColor.png",
                        "alt_image": "CruzcampoBlanco.png",
                        "shadow_image": "CruzcampoSombra.png"
                    }
                }
            ],
            "franchise": null
        },
        "user": {
            "id": 500,
            "push_uid": null,
            "facebook_uid": "10153584558406004",
            "google_uid": null,
            "username": "Melero",
            "email": "pmelsan88@gmail.com",
            "publicname": "Pablo Melero",
            "avatar": "https://fbcdn-profile-a.akamaihd.net/1445034148_1d29d58da0105d51e237d88ff0c06d04",
            "custom_avatar": null,
            "gender": "male",
            "birth": null,
            "city": null,
            "country": null,
            "last_connection_date": "2015-08-02T08:38:43.544+02:00"
        }
    }

### Actualizar valoración de bar por usuario `PUT /users/:user_id/ranks/:id`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
| bar_id | number | | si | ID del bar |
| value | number | 0 | si | Valoración entre el 1 y 10 |

Resultado:

    Code: 200

    {
        "id": 252,
        "value": 5,
        "bar": {
            "id": 844,
            "name": "De Cañas",
            "description": "",
            "address": "Av. de Eduardo Dato,  99",
            "region": "Sevilla",
            "phone": "619524842",
            "rank": null,
            "latitude": 37.3815671,
            "longitude": -5.96712990000003,
            "photo": "De-Ca_as.jpg",
            "products": [
                {
                    "id": 2982,
                    "price": "1.1",
                    "size": {
                        "id": 1,
                        "name": "Caña",
                        "icon": 1,
                        "volume": 20
                    },
                    "brand": {
                        "id": 11,
                        "name": "Cruzcampo",
                        "color": "#e1061c",
                        "image": "CruzcampoColor.png",
                        "alt_image": "CruzcampoBlanco.png",
                        "shadow_image": "CruzcampoSombra.png"
                    }
                }
            ],
            "franchise": null
        },
        "user": {
            "id": 500,
            "push_uid": null,
            "facebook_uid": "10153584558406004",
            "google_uid": null,
            "username": "Melero",
            "email": "pmelsan88@gmail.com",
            "publicname": "Pablo Melero",
            "avatar": "https://fbcdn-profile-a.akamaihd.net/1445034148_1d29d58da0105d51e237d88ff0c06d04",
            "custom_avatar": null,
            "gender": "male",
            "birth": null,
            "city": null,
            "country": null,
            "last_connection_date": "2015-08-02T08:38:43.544+02:00"
        }
    }

### Mostrar valoración de bar por usuario `POST /users/:user_id/ranks/:id`

Resultado:

    {
        "id": 252,
        "value": 5,
        "bar": {
            "id": 844,
            "name": "De Cañas",
            "description": "",
            "address": "Av. de Eduardo Dato,  99",
            "region": "Sevilla",
            "phone": "619524842",
            "rank": null,
            "latitude": 37.3815671,
            "longitude": -5.96712990000003,
            "photo": "De-Ca_as.jpg",
            "products": [
                {
                    "id": 2982,
                    "price": "1.1",
                    "size": {
                        "id": 1,
                        "name": "Caña",
                        "icon": 1,
                        "volume": 20
                    },
                    "brand": {
                        "id": 11,
                        "name": "Cruzcampo",
                        "color": "#e1061c",
                        "image": "CruzcampoColor.png",
                        "alt_image": "CruzcampoBlanco.png",
                        "shadow_image": "CruzcampoSombra.png"
                    }
                }
            ],
            "franchise": null
        },
        "user": {
            "id": 500,
            "push_uid": null,
            "facebook_uid": "10153584558406004",
            "google_uid": null,
            "username": "Melero",
            "email": "pmelsan88@gmail.com",
            "publicname": "Pablo Melero",
            "avatar": "https://fbcdn-profile-a.akamaihd.net/1445034148_1d29d58da0105d51e237d88ff0c06d04",
            "custom_avatar": null,
            "gender": "male",
            "birth": null,
            "city": null,
            "country": null,
            "last_connection_date": "2015-08-02T08:38:43.544+02:00"
        }
    }
