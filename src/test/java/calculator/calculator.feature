Feature: Check calculator operations

 Background:
    * url 'http://localhost:8086/calculator'

  Scenario: Add two positive numbers 
   Given path 'add'
    And request { firstInput : 10, secondInput : 20 }
    And header Accept = 'application/json'
    When method post
    Then status 200
     And match response == {result:  30, message: #notnull}

     
      Scenario: Substract two positive numbers 
   Given path 'subs'
    And request { firstInput : 10, secondInput : 20 }
    And header Accept = 'application/json'
    When method post
    Then status 200
     And match response == {result:  -10, message: #notnull}
     
     
      Scenario: multiply two positive numbers 
   Given path 'multiply'
    And request { firstInput : 10, secondInput : 20 }
    And header Accept = 'application/json'
    When method post
    Then status 200
     And match response == {result:  200, message: #notnull}
     
     
      Scenario: Enter wrong type input
   Given path 'add'
    And request { firstInput : "test", secondInput : 20 }
    And header Accept = 'application/json'
    When method post
    Then status 400
   
     
    Scenario: Failed test case
   Given path 'add'
    And request { firstInput : 20 , secondInput : 20 }
    And header Accept = 'application/json'
    When method post
   Then status 200
     And match response == {result:  6780, message: 'Addition of 10 and 20 is 6780'}

   