Feature: gives the user the possibility to create an account to reconnect later

  As a frequent user
  So that I don't have to fill in the questions every time
  and so that I can be provided with more accurate recommendations
  I want JARVIS to remember my profile

Background: on the starting page, un-authenticated

  Given I am on the Home page
  And I am not authenticated

Scenario: create an account

  Given I follow "Get Started"
  And I answer all the questions with:France,1000 5th Ave New York,student,2,40.72273293527885, -74.00360957704073
  And I check "create_account"
  And I press "Submit"
  Then I should be on the Sign Up page
  Given I fill in "user_email" with "test@test.com"
  And I fill in "user_name" with "test"
  And I fill in "user_password" with "testtest"
  And I fill in "user_password_confirmation" with "testtest"
  And I press "Sign up"
  Then I should be on the Category page
  And I should see all the categories

Scenario: signing in

  Given I have an account with email: "test@test.com" and password: "lololo"
  And I follow "Sign In"
  And I fill in "user_email" with "test@test.com"
  And I fill in "user_password" with "lololo"
  And I press "Log in"
  Then I should be on the Category page
  And I should see all the categories
