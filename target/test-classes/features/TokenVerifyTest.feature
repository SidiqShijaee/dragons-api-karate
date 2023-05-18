Feature: Get Account API

  Background: API Setup steps
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Validate getting account by ID
    Given path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    # def step is to define new variable in =  karate Framework
    * def generatedToken = response.token
    Given path "/api/accounts/get-account"
    And param primaryPersonId = 6861
    And header Authorization = "Bearer "  + generatedToken
    When method get
    Then status 200
    And print response
    