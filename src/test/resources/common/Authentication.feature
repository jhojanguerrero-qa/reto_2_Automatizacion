Feature: Authentication

  Background:
    * url baseUrl

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
    And match response.token == '#string'
    * def token = response.token