@javascript
Feature: Logging in

  Background:
    Given I am not logged in

  @wip
  Scenario: Redirecting to login page when not logged in
    When I navigate to the admin backend
    Then I should see a login page

  @wip
  Scenario: Logging in with valid credentials
    Given I want to view the admin backend
    When I enter valid login credentials
    Then I should be allowed to the view the admin backend

  @wip
  Scenario: Logging in with invalid credentials
    Given I want to view the admin backend
    When I enter invalid login credentials
    Then I should not be allowed to view the admin backend
