Feature: Contiene tests de tipo POST para usuarios

    Scenario: Verificar que se puede crear un usuario
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users'
        * def bodyRequest =
            """
            {
                "id": 12,
                "userName": "TestingUser",
                "password": "12345678"
            }
            """
        And request bodyRequest
        When method POST
        Then status 200
        And match response.id == 12
        And match response.userName == "TestingUser"



    Scenario: No permitir crear usuario si el ID ya existe
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users', 1
        When method GET
        Then status 200

        * def existingUser = response
        * if (existingUser && existingUser.id == 1) karate.abort()

        * def bodyRequest =
            """
            {
                "id": 1,
                "userName": "NuevoUsuario",
                "password": "abc123"
            }
            """
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users'
        And request bodyRequest
        When method POST
        Then status 400




    Scenario: Crear usuario con username fijo y password generado
        Given url 'https://fakerestapi.azurewebsites.net/api/v1'
        And path 'Users'

        * def randomText = read('classpath:utils/generateRandomText.js')
        * def password = call randomText { baseText: 'pwd', length: 8 }

        * def bodyRequest =
            """
            {
                "id": 2,
                "userName": "User 20",
                "password": "#(password)"
            }
            """

        And request bodyRequest
        When method POST
        Then status 200
        And match response.userName == "User 20"
