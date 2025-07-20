Feature: Test del método DELETE para Users

    Scenario: Verificar que se puede eliminar un usuario existente y confirmar que ya no existe
        Given url 'https://fakerestapi.azurewebsites.net/api/v1/'
        And path 'Users', '9'
        When method DELETE
        Then status 200
        And print 'Usuario con ID 9 eliminado correctamente'

    Scenario: Verificar que el usuario eliminado ya no existe
        Given url 'https://fakerestapi.azurewebsites.net/api/v1/'
        And path 'Users', '9'
        When method GET
        Then status 404
        And print 'Usuario con ID 9 no encontrado después de eliminarlo'

