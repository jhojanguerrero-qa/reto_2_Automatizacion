Feature: Update Success Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  @update
  Scenario: Update an existing booking successfully

    * def bookingData = call read('classpath:common/GenerateBookingData.feature')
    * def requestBody = read('classpath:data/booking/format-booking.json')
    * def data = bookingData.result
    * set requestBody.firstname = data.firstName
    * set requestBody.lastname = data.lastName
    * set requestBody.totalprice = data.totalPrice
    * set requestBody.bookingdates.checkin = data.checkin
    * set requestBody.bookingdates.checkout = data.checkout


    * def bookingCreated = call read('BookingPost.feature@create_successful_booking')
    * def bookingId = bookingCreated.bookingId
    * def authenticationCreated = call read('classpath:common/Authentication.feature')

    Given path 'booking', bookingId
    And cookie token = authenticationCreated.token
    And request requestBody
    When method PUT
    Then status 200

    * def formatSchema = read('classpath:data/booking/update-format-booking-schema.json')
    And match response == formatSchema

    And match response.firstname == data.firstName
    And match response.lastname == data.lastName
    And match response.totalprice == data.totalPrice
    And match response.depositpaid == false
    And match response.additionalneeds == 'Breakfast'
    And match response.bookingdates.checkin == data.checkin
    And match response.bookingdates.checkout == data.checkout
