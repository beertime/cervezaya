## Zonas favoritas de usuario

### Crear zona favorita de usuario `POST /users/:user_id/zones`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
| zone_id | number | | si | ID de la zona |

Resultado:

    Code: 201

    {
        "id": 252,
        "zone": {
            "id": 31,
            "name": "Alameda",
            "geometry": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[[-5.9938789,37.4037443],[-5.9946727,37.3989713],[-5.9948685,37.3978931],[-5.9955095,37.3967297],[-5.993042,37.3960649],[-5.9932881,37.3966615],[-5.9925377,37.397207],[-5.9920013,37.400906],[-5.9938789,37.4037443]]]]}",
            "city": "Sevilla",
            "country": "ES",
            "published": true
        }
    }

### Listado de zonas favoritas de usuario `POST /users/:user_id/zones`

Resultado:

    [
        {
            "id": 252,
            "zone": {
                "id": 31,
                "name": "Alameda",
                "geometry": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[[-5.9938789,37.4037443],[-5.9946727,37.3989713],[-5.9948685,37.3978931],[-5.9955095,37.3967297],[-5.993042,37.3960649],[-5.9932881,37.3966615],[-5.9925377,37.397207],[-5.9920013,37.400906],[-5.9938789,37.4037443]]]]}",
                "city": "Sevilla",
                "country": "ES",
                "published": true
            }
        }
    ]

### Borrar zona favorita de usuario  `DELETE /users/:user_id/zones/:id`

Resultado:

    Code: 204
