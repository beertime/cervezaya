## Feedback de usuarios

### Crear nuevo contacto o feedback de usuario `POST /users/:user_id/contacts`

| param | type | default | required | description |
| --- | --- | --- | --- | --- |
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
