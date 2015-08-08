## Opiniones de usuario de bares

### Crear nuevo contacto o feedback de usuario `POST /contacts`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
| user_id | number | | si | ID del usuario |
| message | text | | si | Mensaje |

Resultado:

    Code: 201

    [
        {
            "id": 1,
            "user_id": 1,
            "message": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        }
    ]
