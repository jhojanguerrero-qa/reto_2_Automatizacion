Feature: Get Bookings on restful-booker

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Get All Bookings

    Given path 'booking'
    When method GET
    Then status 200


  Scenario: Get One Booking

    * def bookingCreated = call read('BookingPost.feature@create_successful_booking')
    * def bookingId = bookingCreated.bookingId
    And match bookingId == '#number'

    Given path 'booking', bookingId
    When method GET
    Then status 200

    And match response ==
      """
      {
        firstname: '#string',
        lastname: '#string',
        totalprice: '#number',
        depositpaid: '#boolean',
        bookingdates:
        {
          checkin: '#regex \\d{4}-\\d{2}-\\d{2}',
          checkout: '#regex \\d{4}-\\d{2}-\\d{2}'
        },
        additionalneeds: '#string'
      }
      """


