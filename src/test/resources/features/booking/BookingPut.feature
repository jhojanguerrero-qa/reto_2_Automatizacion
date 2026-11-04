Feature: Update Success Booking

  Background:
    * url baseUrl

  @update
  Scenario: Update an existing booking successfully

    * def bookingData = call read('classpath:common/GenerateBookingData.feature')
    * def data = bookingData.result
    * def firstName = data.firstName
    * def lastName = data.lastName
    * def totalPrice = data.totalPrice
    * def checkin = data.checkin
    * def checkout = data.checkout
    * def requestBody = read('classpath:data/booking/format-booking.json')

    * def bookingCreated = call read('BookingPost.feature@create_successful_booking')
    * def bookingId = bookingCreated.bookingId
    * def auth = call read('classpath:common/Authentication.feature')

    Given path 'booking', bookingId
    And cookie token = auth.token
    And request requestBody
    When method PUT
    Then status 200


    * def formatSchema = read('classpath:data/booking/booking-schema.json')
    And match response == formatSchema
    And match response == requestBody
