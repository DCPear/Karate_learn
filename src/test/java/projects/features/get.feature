Feature: Get API Examples

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

    #simple
  Scenario: Get request
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    #background
  Scenario: Get request with background
    Given path '/users?page=2'
    When method GET
    Then status 200

    #background path and param
  Scenario: Get request with background and params
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    
   #get with assertions
  Scenario: Get request with background and params
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And  print response
    And assert response.data.length == 6
    And match response.data[3].first_name != null
    And match $.data[2].first_name == 'Tobias'