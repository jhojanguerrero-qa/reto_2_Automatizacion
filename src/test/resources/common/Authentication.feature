Feature: Authentication

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'


  Scenario: Generate auth token
    Given path 'auth'
    And request
      """
      {
        "username": "admin",
        "password": "password123"
      }
      """
    When method POST
    Then status 200
    * def token = response.token