Feature: Survey taker should have Login

Scenario: Successful Login
    Given I am not logged in
    And I am on the surveys home page
    Then I should see "Log in"
    When I fill in "Email" with "root@surveybuilder.com"
    When I fill in "Password" with "root1234"
    When I press "Log in"
    Then I should see "Signed in successfully."
    Then I should see "Create New Survey"
    Then I should see "Survey Results"

 