Feature: Logging in

  Background:
     Given there are posts
     And there is a registered user

  Scenario: Receiving an authentication token
    When I request an authentication token using valid credentials
    Then I should receive an authentication token

  Scenario: Viewing posts with valid token
    Given I have requested an authentication token using valid credentials
    When I use that valid authentication token
    Then I should be able to access the posts

  Scenario: Viewing posts with invalid token is not possible
    Given I have requested an authentication token using valid credentials
    When I use a different authentication token
    Then I should be redirected to the sign in page
