Feature: Delete Success Booking

  Background:
    * url baseUrl

  @delete
  Scenario: Delete booking successfully

    * def bookingCreated = call read('BookingPost.feature@create_successful_booking')
    * def bookingId = bookingCreated.bookingId

    * def auth = call read('classpath:common/Authentication.feature')

    Given path 'booking', bookingId
    And cookie token = auth.token
    When method DELETE
    Then status 201

    Given path 'booking', bookingId
    When method GET
    Then status 404
