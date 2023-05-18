Feature: Create an Account

  Background: API Test
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

 
  Scenario: End-to-End Create Account Test
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "email": "Sultann@gmail.com",
      "firstName": "Ashraf",
      "lastName": "Adell",
      "title": "Mr",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Software Tester",
      "dateOfBirth": "1990-01-01",
      
      }
      """
    When method post
    Then status 201
    Then print response
    And assert response.email == "Sultann@gmail.com"
    #Add Phone
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    Then request
      """
      {
      "phoneNumber": "1234567889",
      "phoneExtension": "1355",
      "phoneTime": "Anytime",
      "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And print response
    #Add Car
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    Then request
      """
      {
      "make": "Ferrari",
      "model": "fire",
      "year": "2024",
      "licensePlate": "786321"
      }

      """
    When method post
    Then status 201
    And print response
    #Add Address
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    Then request
      """
      {
      "addressType": "Apt",
      "addressLine1": "1256 Pjr",
      "city": "Falls church",
      "state": "VA",
      "postalCode": "22094",
      "countryCode": "+1",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response