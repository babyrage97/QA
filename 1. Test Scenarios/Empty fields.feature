Feature: polovni automobili

  Scenario: Empty fields
    Given I am on the Polovni Automobili registration page
    When I leave one or more required fields empty
    And I click on the "Registry se" button
    Then I should see an error message asking me to fill in all required fields


