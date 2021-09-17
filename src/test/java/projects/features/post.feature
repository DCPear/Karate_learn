Feature: Post API Examples

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')
    * def requestBody = read ('request1.json')
    * def projectPath = karate.properties ['user.dir']
    * def reqPath = projectPath + 'src/test/java/data/userReq.json'
    * def resPath = projectPath + 'src/test/java/data/userRes.json'

    #simple with background
  Scenario: Post request w background
    Given path '/users'
    And request {  "name": "morpheus",  "job": "leader"  }
    When method POST
    Then status 201
    And match $.name == 'morpheus'
    And print response

    #handling dynamic values
  Scenario: Post request w dynamic values
    Given path '/users'
    And request {  "name": "Joey",  "job": "leader"  }
    When method POST
    Then status 201
    And match $.name == 'Joey'
    And match $ == {"name":"Joey","job":"leader","id":"#string","createdAt":"#ignore"}
    And print response

    #Getting the response from a file (response1.json is in the same folder)
  Scenario: Post request w assertions 1
    Given path '/users'
    And request {  "name": "Joey",  "job": "leader"  }
    When method POST
    Then status 201
    And match $.name == 'Joey'
    And match $ == {"name":"Joey","job":"leader","id":"#string","createdAt":"#ignore"}
    And match $ == expectedOutput
    And print response

     #read the request body from a file (response1.json is in the same folder)
  Scenario: Post request w assertions 2
    Given path '/users'
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response

    #finding project path for files not in the same folder
  Scenario: Post request w assertions 3
    Given path '/users'
    And def projectPath = karate.properties ['user.dir']
    And print projectPath
    And def reqPath = projectPath + '/src/test/java/data/user.json'
    And print reqPath

     #read the request body from a file (user.json is in a different folder)
  Scenario: Post request w assertions 4
    Given path '/users'
    And def home = java.lang.System.getProperty('user.dir')
    And print 'path ' , home
    And print projectPath
    And print reqPath
    And def requestBody = reqPath
    And print requestBody
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match $ contains {id:"#notnull"}

       #read the request body from a file (response1.json is in the same folder) an substitute values
  Scenario: Post request w assertions 2
    Given path '/users'
    And set requestBody.job = 'Pilot'
    And request requestBody
    When method POST
    Then status 201
    And print response

