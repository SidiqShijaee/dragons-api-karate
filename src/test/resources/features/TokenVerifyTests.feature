Feature: Token Verify Test

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"

  @Regression
  Scenario: Verify Valid Token
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "supervisor"
    When method get
    Then status 200
    And print response
    And assert response == "true"

  Scenario: Negetive test validate token verify wrong username
    And path "/api/token"
    And request {"username": "wrongusername","password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "wrongusername"
    When method get
    Then status 400
    And print response
    And assert response.httpStatus == "BAD_REQUEST"
    And assert response.errorMessage == "Wrong Username send along with Token"
