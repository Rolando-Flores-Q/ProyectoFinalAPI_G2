Feature: Obtener usuarios mediante endpoints GET

    Scenario: Verificar que se puede obtener la lista de usuarios
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users'
        When method GET
        Then status 200
        * print response
        * assert response.length == 10


    Scenario: Verificar que se puede obtener un usuario existente por ID
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users', 1
        When method GET
        Then status 200
        And match response contains { id: 1, userName: '#string', password: '#string' }

    Scenario: Verificar que al consultar un usuario inexistente se devuelve error
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users', 9999
        When method GET
        Then status 404
        And assert response.title == "Not Found"

    Scenario: Verificar que al consultar un usuario con ID negativo se devuelve error
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users', -1
        When method GET
        Then status 404
        And assert response.title == "Not Found"

