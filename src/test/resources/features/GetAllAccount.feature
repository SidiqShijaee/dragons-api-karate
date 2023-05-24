Feature: Get All Accounts

Background: API test
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"
    
    Scenario: Get all accounts
    Given path "/api/accounts/get-all-accounts"
    And header Authorization = "Bearer " + generatedToken
    When method get
    When status 200
    And print response