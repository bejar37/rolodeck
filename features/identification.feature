Feature: Identification

  In order to get a personalized contact list
  As a well-connected user of the rolodecks
  I want to identify myself to the service

  Scenario: I identify myself
    Given I have a contact that represents me
    When I go to my show contact page
    And I press the login button
    Then I see my name in the nav bar
