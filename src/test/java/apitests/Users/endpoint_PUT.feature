Feature: Test del método PUT para Users

    Scenario: Verificar que se puede actualizar un usuario existente
        Given url 'https://fakerestapi.azurewebsites.net/api/v1/'
        And path 'Users', '9'
        * def payload =
            """
            {
                "id": 9,
                "userName": "UpdatedUser",
                "password": "NewPassword123"
            }
            """
        And request payload
        When method PUT
        Then status 200
        And match response ==
            """
            {
                "id": 9,
                "userName": "UpdatedUser",
                "password": "NewPassword123"
            }
            """
