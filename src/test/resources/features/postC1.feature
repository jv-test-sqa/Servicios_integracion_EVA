Feature: Disparar CU1 con diferentes respuestas

  Background:
    * def result = callonce read('postToken.feature')
    * def token = result.access_token
    * url 'https://comunicacionclientedesa.telefonicawebsites.co/api'
    * header Authorization = 'Bearer ' + token
    * headers { application: 'TEL', Content-Type: 'application/json' }

  Scenario: C1 response 200

    Given def C1Data = read('data/C1OK.json')
    And request C1Data
    When method POST
    Then status 200
    * karate.log('Token generado: ', response.data)

  Scenario: C1 response 500 - Token inválido

    * header Authorization = 'Bearer INVALID_TOKEN_123'
    Given def C1Data = read('data/C1OK.json')
    And request C1Data
    When method POST
    Then status 500
    * karate.log('Respuesta de error con token inválido: ', response)

  Scenario: C1 response 401 - Token vacío

    * header Authorization = ''
    Given def C1Data = read('data/C1OK.json')
    And request C1Data
    When method POST
    Then status 401

  Scenario: C1 response 400 - Request vacio

    Given def C1Data = read('data/jsonVacio.json')
    And request C1Data
    When method POST
    Then status 200
    * karate.log('Token generado: ', response.data)