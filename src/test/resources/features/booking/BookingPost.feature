Feature: Create success new booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  @create_successful_booking
  Scenario: Create new Booking

    * def bookingData = call read('classpath:common/GenerateBookingData.feature')
    * def requestBody = read('classpath:data/booking/format-booking.json')
    * def data = bookingData.result
    * set requestBody.firstname = data.firstName
    * set requestBody.lastname = data.lastName
    * set requestBody.totalprice = data.totalPrice
    * set requestBody.bookingdates.checkin = data.checkin
    * set requestBody.bookingdates.checkout = data.checkout

    Given path 'booking'
    And request requestBody
    When method POST
    Then status 200

    * def formatSchema = read('classpath:data/booking/create-format-booking-schema.json')
    And match response == formatSchema

    * def bookingId = response.bookingid
    And match response.booking.firstname == requestBody .firstname
    And match response.booking.lastname == requestBody .lastname
    And match response.booking.totalprice == requestBody .totalprice
    And match response.booking.depositpaid == requestBody .depositpaid
    And match response.booking.bookingdates.checkin == requestBody .bookingdates.checkin
    And match response.booking.bookingdates.checkout == requestBody .bookingdates.checkout
    And match response.booking.additionalneeds == requestBody .additionalneeds
