## Zonas

### Lista de zonas `GET /zones`

| param | type | description |
| --- | --- | --- | --- |
| city | string | Filtro por ciudad `city=Sevilla`, si no se especifica devuelve según IP |
| longitude | float | | Longitud `longitude=-3.00000`, sólo si no se especifica city |
| latitude | float | | Latitud `latitude=40.00000`, sólo si no se especifica city |

Resultado:

    Code: 200

    [
        {
            "id": 31,
            "name": "Alameda",
            "geometry": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[[-5.9938789,37.4037443],[-5.9946727,37.3989713],[-5.9948685,37.3978931],[-5.9955095,37.3967297],[-5.993042,37.3960649],[-5.9932881,37.3966615],[-5.9925377,37.397207],[-5.9920013,37.400906],[-5.9938789,37.4037443]]]]}",
            "city": "Sevilla",
            "country": "ES",
            "published": true,
            "bars_count": 10
        }
    ]
