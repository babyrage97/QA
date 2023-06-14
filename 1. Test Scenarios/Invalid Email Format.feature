Feature: polovni automobili


  Scenario: Invalid Email Format
    Given I am on the Polovni Automobile registration page
    When I fill in the registration form with an invalid email address format and password
    And I submit the form
    Then I should see an error message asking me to enter a valid email address format
