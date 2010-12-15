@discussions
Feature: Discussions
  In order to have discussions on my website
  As an administrator
  I want to manage discussions

  Background:
    Given I am a logged in refinery user
    And I have no discussions

  @discussions-list @list
  Scenario: Discussions List
   Given I have discussions titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of discussions
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @discussions-valid @valid
  Scenario: Create Valid Discussion
    When I go to the list of discussions
    And I follow "Add New Discussion"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 discussion

  @discussions-invalid @invalid
  Scenario: Create Invalid Discussion (without title)
    When I go to the list of discussions
    And I follow "Add New Discussion"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 discussions

  @discussions-edit @edit
  Scenario: Edit Existing Discussion
    Given I have discussions titled "A title"
    When I go to the list of discussions
    And I follow "Edit this discussion" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of discussions
    And I should not see "A title"

  @discussions-duplicate @duplicate
  Scenario: Create Duplicate Discussion
    Given I only have discussions titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of discussions
    And I follow "Add New Discussion"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 discussions

  @discussions-delete @delete
  Scenario: Delete Discussion
    Given I only have discussions titled UniqueTitleOne
    When I go to the list of discussions
    And I follow "Remove this discussion forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 discussions
 