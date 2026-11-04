Feature: Create success new booking

  Background:
    * url baseUrl

  @create_successful_booking
  Scenario: Create new Booking

    * def bookingData = call read('classpath:common/GenerateBookingData.feature')
    * def data = bookingData.result
    * def firstName = data.firstName
    * def lastName = data.lastName
    * def totalPrice = data.totalPrice
    * def checkin = data.checkin
    * def checkout = data.checkout
    * def requestBody = read('classpath:data/booking/format-booking.json')

    Given path 'booking'
    And request requestBody
    When method POST
    Then status 200

    * def formatSchema = read('classpath:data/booking/booking-create-schema.json')
    And match response == formatSchema

    * def bookingId = response.bookingid
    * def bookingRequest = requestBody
    And match response.booking == requestBody
