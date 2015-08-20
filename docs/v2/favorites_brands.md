## Marcas favoritas de usuario

### Crear marca favorita de usuario `POST /users/:user_id/brands`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
| brand_id | number | | si | ID de la marca |

Resultado:

    Code: 201

    {
        "id": 252,
        "brand": {
            "id": 94,
            "name": "A.K.Damm",
            "color": "#ecab0e",
            "image": "AKDammColor.png",
            "alt_image": "AKDammBlanca.png",
            "shadow_image": "AKDammSombra.png"
        }
    }

### Listado de marcas favoritas de usuario `POST /users/:user_id/brands`

Resultado:

    [
        {
            "id": 252,
            "brand": {
                "id": 94,
                "name": "A.K.Damm",
                "color": "#ecab0e",
                "image": "AKDammColor.png",
                "alt_image": "AKDammBlanca.png",
                "shadow_image": "AKDammSombra.png"
            }
        }
    ]

### Borrar marca favorita de usuario  `DELETE /users/:user_id/brands/:id`

Resultado:

    Code: 204
