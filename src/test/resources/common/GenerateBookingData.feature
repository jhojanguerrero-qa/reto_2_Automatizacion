Feature: Generate random booking data

  Scenario: Generate random booking data

    * def LocalDate = Java.type('java.time.LocalDate')

    * def firstName = 'Jim' + Math.floor(Math.random() * 1000)
    * def lastName = 'Brown' + Math.floor(Math.random() * 1000)
    * def totalPrice = Math.floor(Math.random() * 1000) + 100
    * def checkin = LocalDate.now().toString()
    * def checkout = LocalDate.now().plusDays(7).toString()

    * def result  =
      """
      {
        firstName: '#(firstName)',
        lastName: '#(lastName)',
        totalPrice: '#(totalPrice)',
        checkin: '#(checkin)',
        checkout: '#(checkout)'
      }
      """