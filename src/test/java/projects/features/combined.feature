Feature: Get Put Delete API Examples

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'


  Scenario: get request w background
    Given path '/users/2'
    When method GET
    Then status 200
    And print response

  Scenario: put request w background
    Given path '/users/2'
    And request {  "name": "Smith",  "job": "Servant leader"  }
    When method PUT
    Then status 200
    And print response

  Scenario: delete request w background
    Given path '/users/2'
    When method DELETE
    Then status 204
    And print response

  Scenario: test config file set up
    Given print name
