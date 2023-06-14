Feature: polovni automobili


  Scenario: Email already registered
    Given I am on the Polovni Automobile registration page
    When I fill in the registration form with an email that is already registered and password
    And I submit the form
    Then I should see an error message asking me to enter a different email address


