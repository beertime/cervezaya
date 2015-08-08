## Promociones

### Lista de promociones `GET /promotions`

| param | type | default | description |
| --- | --- | --- | --- |
| date | date | | Devuelve promociones de la fecha indicada |
| start_date | date | | Devuelve promociones desde la fecha |
| end_date | date | | Devuelve promociones hasta la fecha |

Resultado:

    [
        {
            "id": 8,
            "title": "De Cañas Viernes",
            "description": "Muestra la app de CervezaYa al camarero y aprovecha la promoción de los Viernes; Paella + Caña por sólo 2,50€.",
            "image": "De_ca_as_5.png",
            "start_date": "2015-06-01 07:00",
            "end_date": "2020-06-01 23:59",
            "recurrent": true,
            "current_iteration": [
                "2015-08-14 07:00",
                "2015-08-14 23:59"
            ],
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
            }
        }
    ]
