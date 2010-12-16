@discussion_topics
Feature: Discussion Topics
  In order to have discussion_topics on my website
  As an administrator
  I want to manage discussion_topics

  Background:
    Given I am a logged in refinery user
    And I have no discussion_topics

  @discussion_topics-list @list
  Scenario: Discussion Topics List
   Given I have discussion_topics titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of discussion_topics
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @discussion_topics-valid @valid
  Scenario: Create Valid Discussion Topic
    When I go to the list of discussion_topics
    And I follow "Add New Discussion Topic"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 discussion_topic

  @discussion_topics-invalid @invalid
  Scenario: Create Invalid Discussion Topic (without name)
    When I go to the list of discussion_topics
    And I follow "Add New Discussion Topic"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 discussion_topics

  @discussion_topics-edit @edit
  Scenario: Edit Existing Discussion Topic
    Given I have discussion_topics titled "A name"
    When I go to the list of discussion_topics
    And I follow "Edit this discussion_topic" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of discussion_topics
    And I should not see "A name"

  @discussion_topics-duplicate @duplicate
  Scenario: Create Duplicate Discussion Topic
    Given I only have discussion_topics titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of discussion_topics
    And I follow "Add New Discussion Topic"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 discussion_topics

  @discussion_topics-delete @delete
  Scenario: Delete Discussion Topic
    Given I only have discussion_topics titled UniqueTitleOne
    When I go to the list of discussion_topics
    And I follow "Remove this discussion topic forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 discussion_topics
 