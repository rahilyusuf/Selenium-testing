Feature: Uset management
As a new user
I want to register for an account
And also login using the registered credentials
So that I can access the SocialMesia
# happy

  Scenario: Successful user registration
    Given Iam in registration page
    When I enter the username as "rahil"
    And I enter valid email address as "rahilyusuf.ry@gmai.com"
    * I enter password as "123Passrahil"
    * I click on the register button
    Then I should redirect to Login page

  Scenario: Successful user login
    Given Iam in login page
    When I enter the registered username as "rahil"
    And I enter registered password as "123Passrahil"
    * I click on the login button
    Then I should redirect to Home page

#unhappy
  Scenario: Unsuccessful user registration
    Given I am on the registration page
    When I enter the following details:
      | username   | email   | password   | name   |
      | <username> | <email> | <password> | <name> |
    And I click on the register button
    And I should remain on the registration page
    Examples:
      | username | email                   | password     | 
      |          | testuser@gmail.com      | ysuf123      | 
      | testuser |                         | pass123      | 
      | testuser | testuser@gmail.com      |              | 
      | testuser | testuser@gmail.com      | pass123      | 
      | rahil    | rahilyusuf.ry@gmail.com | 123Passrahil | 
      
  Scenario Outline: Unsuccessful user login
    Given I am on the login page
    When I enter the following credentials:
      | username   | password   |
      | <username> | <password> |
    And I click on the login button
    Then I should see a login error message "<error_message>"
    And I should remain on the login page
    Examples:
      | username | password | 
      |          | fail123  | 
      | testuser |          | 
      | exists12 | wrong    | 
      | default3 | 123pass  | 
