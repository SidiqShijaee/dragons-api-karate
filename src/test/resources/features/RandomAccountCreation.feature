Feature: Random Account Creation

  Background: Setup Test Generate Token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create Account with Random Email
    # call Java Class and method with Karate
    * def dataGenerator = Java.type('api.data.GenerateData')
    * def email = dataGenerator.getEmail()
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + token
    And request
      """
           {
           "email": "java@gmail.com",
           "firstName": "Arrash",
           "lastName": "Pjr",
           "title": "Mr",
           "gender": "MALE",
           "maritalStatus": "SINGLE",
           "employmentStatus": "Software Tester",
           "dateOfBirth": "1990-01-01",
           
           }
      """
    When method post
    Then status 201
    And print response