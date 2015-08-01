# CervezaYa API v2

Documentación para la segunda versión de la API. Usaremos siempre que podamos HTTPS.

URL: https://api.cervezaya.com

HEADERS:

    X-User-Email: admin@example.com
    X-User-Token: secret
    Accept: application/vnd.cervezaya.com; version=2

Se debe usar el usuario y token que se asigna a los usuarios administradores en el [backoffice](https://admin.cervezaya.com).

## Tipos

### Lista de tipos `GET /types`

Resultado:

    [
        {
            "id": 1,
            "name": "Sin Alcohol"
        }
    ]

## Tamaños o formatos

### Lista de tipos `GET /sizes`

Resultado:

    [
        {
            "id": 1,
            "name": "Caña",
            "icon": 1,
            "volume": 20
        }
    ]

## Marcas

### Lista de marcas `GET /brands`

Resultado:

    [
        {
            "id": 94,
            "name": "A.K.Damm",
            "color": "#ecab0e",
            "image": "AKDammColor.png",
            "alt_image": "AKDammBlanca.png",
            "shadow_image": "AKDammSombra.png"
        }
    ]

## Bares

### Lista de bares `GET /bars`

| param | type | default | description |
| --- | --- | --- | --- |
| longitude | float | | Longitud `longitude=-3.00000` |
| latitude | float | | Latitud `latitude=40.00000` |
| min_distance | number | | Mínima distancia en Km `min_distance=1` |
| max_distance | number | | Máxima distancia en Km `max_distance=2` |
| max_price | float | | Máximo precio `max_price=3.0` |
| user_id | number | | ID de usuario `user_id=1` |
| q | string | | Búsqueda por string en nombre y dirección `q=inedito` |
| brands_ids | array[number] | | ID de marcas `brands_ids[]=1&brands_ids=2` |
| sizes_ids | array[number] | | ID de marcas `sizes_ids[]=1&sizes_ids=2` |
| types_ids | array[number] | | ID de tipos `types_ids[]=1&types_ids=2` |
| icons | array[number] | | ID de iconos `icons[]=1&icons=2` |
| limit | number | 25 | Limita el número de resultados `limit=25` |
| offset | number | 0 | Número de bares que se salta antes de dar el resultado `offset=25` |

Resultado:

    [
        {
            "id": 87,
            "name": "El Inédito",
            "description": "",
            "address": "Avenida de Kansas City, 92",
            "region": "Sevilla",
            "phone": "954 311 559",
            "rank": null,
            "latitude": 37.4042559,
            "longitude": -5.9562317,
            "photo": "Inedito.jpg",
            "products": [
                {
                    "id": 97,
                    "price": "1.0",
                    "size": {
                        "id": 1,
                        "name": "Caña",
                        "icon": 1,
                        "volume": 20
                    },
                    "brand": {
                        "id": 20,
                        "name": "Estrella Galicia",
                        "color": "#dda00c",
                        "image": "EstrellaGaliciaColor.png",
                        "alt_image": "EstrellaGaliciaBlanco.png",
                        "shadow_image": "EstrellaGaliciaSombra.png"
                    }
                }
            ]
            "franchise": null
        },
        {
            "id": 389,
            "name": "100 Montaditos",
            "description": null,
            "address": "Avenida del Aljarafe, 16",
            "region": "Sevilla",
            "phone": null,
            "rank": null,
            "latitude": 37.3690423,
            "longitude": -6.0405333,
            "photo": null,
            "products": [],
            "franchise": {
                "id": 1,
                "name": "100 Montaditos",
                "photo": "100Montaditos.png",
                "products": [
                    {
                        "id": 4061,
                        "price": "1.0",
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
                ]
            }
        }
    ]

### Detalle de bar `GET /bars/:id`

Resultado:

    {
        "id": 87,
        "name": "El Inédito",
        "description": "",
        "address": "Avenida de Kansas City, 92",
        "region": "Sevilla",
        "phone": "954 311 559",
        "rank": null,
        "latitude": 37.4042559,
        "longitude": -5.9562317,
        "photo": "Inedito.jpg",
        "products": [
            {
                "id": 97,
                "price": "1.0",
                "size": {
                    "id": 1,
                    "name": "Caña",
                    "icon": 1,
                    "volume": 20
                },
                "brand": {
                    "id": 20,
                    "name": "Estrella Galicia",
                    "color": "#dda00c",
                    "image": "EstrellaGaliciaColor.png",
                    "alt_image": "EstrellaGaliciaBlanco.png",
                    "shadow_image": "EstrellaGaliciaSombra.png"
                }
            }
        ]
        "franchise": null
    }
