Feature: Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  @create_successful_booking
  Scenario: Create new Booking

    * def createBooking =
      """
      {
        "firstname": "Jim",
        "lastname": "Brown",
        "totalprice": 111,
        "depositpaid": false,
        "bookingdates": {
          "checkin": "2018-01-01",
          "checkout": "2019-01-01"
        },
        "additionalneeds": "Breakfast"
      }
      """

    Given path 'booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request createBooking
    When method POST
    Then status 200

    * def expectedName = createBooking .firstname
    * def expectedLastname = createBooking .lastname
    * def expectedTotalprice = createBooking .totalprice
    * def expectedDepositpaid = createBooking .depositpaid
    * def expectedBookingdatesCheckin = createBooking .bookingdates.checkin
    * def expectedBookingdatesCheckout = createBooking .bookingdates.checkout
    * def expectedAdditionalneeds = createBooking .additionalneeds
    * def bookingId = response.bookingid


    And match response.booking ==
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

    And match response.booking.firstname == expectedName
    And match response.booking.lastname == expectedLastname
    And match response.booking.totalprice == expectedTotalprice
    And match response.booking.depositpaid == expectedDepositpaid
    And match response.booking.bookingdates.checkin == expectedBookingdatesCheckin
    And match response.booking.bookingdates.checkout == expectedBookingdatesCheckout
    And match response.booking.additionalneeds == expectedAdditionalneeds
