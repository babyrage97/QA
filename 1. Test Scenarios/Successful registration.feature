Feature: polovni automobili


  Scenario: Successful registration
    Given I am on the Polovni Automobile registration page
    When I fill in the registration form with a valid email address, password
    And I accept all rules for website
    And I submit the form
    Then I should receive a verification email and be redirected to the successful registration page
