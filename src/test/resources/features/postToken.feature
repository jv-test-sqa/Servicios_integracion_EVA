Feature: Generar token

  Scenario: Generar token

    * url 'https://comunicacioncliente.telefonicawebsites.co/token'
    * headers { token: '76F6FED35FDB74D4', application: 'TEL', Content-Type: 'application/json' }

    Given def tokenData = read('data/token.json')
    And request tokenData
    When method POST
    Then status 200
    And match response.access_token == '#notnull'
    * karate.log('Token generado: ', response.access_token)


