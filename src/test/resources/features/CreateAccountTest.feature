#Scenario 10:
#Endpoint = /api/accounts/add-primary-account.
#Status Code = 201
#Assert Email Address
#Notes:
#duplicate email not accepted
#For Gender and maritalStatus you have to use the Predefined value.
#Once you create Account validate database and take screenshot
#FirstName and LastName should be your name
#In Request body we don't need id and isNew field(you can remove them)
Feature: Create Account Test

  #Scenario 10
  Background: API Test Setup
    Given url "https://tek-insurance-api.azurewebsites.net"
    When path "/api/toekn"
    And request {username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = respnose.token
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "email": "sidiq_karate1@tekschool.us",
      "firstName": "Sidiq"
      "lastName": "Shijaee"
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "Married"
      "employmentStatus": "Tester",
      "dataOfBirth": "1980-01-01"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == "sidiq_karate1@tekschool.us"
