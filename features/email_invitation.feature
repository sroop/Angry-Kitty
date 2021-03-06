Feature: Invitation email
  In order to add friends to an event
  As a organiser
  I want to send an invitation email

  Background: participants are added by the organiser

    Given There is an event with an organiser
    And there is a participant with an email address
    And there is an unregistered invitee
    And there is a registered invitee

  Scenario: sending the initial invitations
    Then an email containing a link will be sent to the participant

  Scenario: an existing user clicks the link and they are not signed in
    Given there is no current user
    And the invitee is already a user
    When the registered user clicks the link in the invitation email
    And the existing user will be added to the event
    Then they will be re-directed to the event page

  Scenario: an existing user clicks the link and they are signed in
    Given the invitee is the current user
    When the registered user clicks the link in the invitation email
    And the existing user will be added to the event
    Then they will be re-directed to the event

  Scenario: an unregistered user clicks the link
    When an unregistered user clicks the link in the invitation email
    Then they will be re-directed to the sign up page
    And they will see their details in the form
    Then they can fill in their invitee details on the sign up page
    And they press "Sign up"
    Then the new user will be added to the event
    And they will be re-directed to the event

  Scenario: a new user clicks the link and signs up, then clicks the link again while signed in
    When an unregistered user clicks the link in the invitation email
    Then they will be re-directed to the sign up page
    And they will see their details in the form
    Then they can fill in their invitee details on the sign up page
    And they press "Sign up"
    Then the new user will be added to the event
    And they will be re-directed to the event
    Given the participant clicks the link in the invitation email
    Then the participant will not be added to the event
    And they will be re-directed to the event

  @javascript
  Scenario: an organiser can send an invitation email to an invitee
    Given I am logged in as an organiser
    When I am on the event page
    When I click on the edit invitee button
    And  I click on Save and resend invite
    Then I want to send an invitation email to the invitee


  # Scenario: an existing user receives an invite via a different email address
  #   Given the invitee is a user
  #   And they are not logged in
  #   When the existing



     # Scenario: resending the initial invitation
  #   When I press the invite button for a participant
  #   Then an email will be sent to the participant
  #   And it will contain links to accept or decline the invitation