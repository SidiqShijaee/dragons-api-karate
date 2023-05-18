Feature: Get Account API

  #Scenario 9:
  #Endpoint = /api/accounts/get-account
  #For primaryPersonId = <One of your accounts already created
  #Make sure email address is correct.
  Background: API Setup Steps
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get Account API Call With existing account
    Given path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    # def step is to define new variable in Karate Framework
    * def generatedToken = response.token
    Given path "api/accounts/get-account"
    And param primaryPersonId = "6837"
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == 6837
    And assert response.primaryPerson.email == "sidiq123@gmail.com"
