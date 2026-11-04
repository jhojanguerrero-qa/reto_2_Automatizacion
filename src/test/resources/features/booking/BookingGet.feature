Feature: Get Bookings on restful-booker

  Background:
    * url baseUrl

  Scenario: Get All Bookings

    Given path 'booking'
    When method GET
    Then status 200
    And match each response contains { bookingid: '#number' }

  Scenario: Get One Booking

    * def bookingCreated = call read('BookingPost.feature@create_successful_booking')
    * def bookingId = bookingCreated.bookingId
    And match bookingId == '#number'

    Given path 'booking', bookingId
    When method GET
    Then status 200

    * def formatSchema = read('classpath:data/booking/booking-schema.json')
    And match response == formatSchema
    And match response == bookingCreated.bookingRequest


