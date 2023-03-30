Feature: sample karate test script
for help, see: https://github.com/intuit/karate/wiki/IDE-Support

Scenario: get all employees
  Given url 'http://localhost:8080/api/employees'
  When method get
  Then status 200

Scenario: create a employee and then get it by id
  * def employee =
    """
    {
       "firstName": "yubi5",
       "lastName": "security",
       "email": "yubi5@gmail.com"
    }
    """

  Given url 'http://localhost:8080/api/employees'
  And request employee
  When method post
  Then status 201
  And print response

  * def id = response.id
  * print 'created id is: ', id

# for get by id  
Scenario: get  employee by id
  Given url 'http://localhost:8080/api/employees/5'
  When method get
  Then status 200
  And print response

Scenario: update employee for id
  * def employee =
    """
    {
       "firstName": "yubiedited",
       "lastName": "security",
       "email": "yubi5edited@gmail.com"
    }
    """

  Given url 'http://localhost:8080/api/employees/5'
  And request employee
  When method put
  Then status 200
  And print response

# delete employee by id 
#Scenario: delete  employee by id
 # Given url 'http://localhost:8080/api/employees/2'
 # When method delete
 # Then status 200
 # And print response


Scenario: get all employees
  Given url 'http://localhost:8080/api/employees'
  When method get
  Then status 200
  And print response