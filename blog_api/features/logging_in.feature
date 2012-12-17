Feature: Logging in

 @wip
 Scenario: Logging in with valid credentials
   Given there is a registered admin
   When I log in as that user
   Then I should be able to access a protected resource
