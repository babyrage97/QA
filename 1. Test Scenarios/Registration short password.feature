Feature: polovni automobili


  Scenario: Registration short password
    Given I am on the Polovni Automobile registration page
    When I fill in the registration form with a short password password and valid email address
    And I submit the form
    Then I should see an error message asking me to enter a minimum 8 character in password
