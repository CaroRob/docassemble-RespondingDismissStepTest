@dismiss_intro_case_ended_with_order
Feature: User paths

Background: 
  Given the maximum seconds for each Step is 90

@row1
Scenario: Row #1 – Improper service & not properly served (complicated with (1)/(2))
  Given I start the interview at "dismiss_step_test.yml"
    And I get to the question id "final screen" with this data:
    | var                                  | value           | trigger |
    | user_need                            | answer custody  |         |
    | type_of_response['case in 2 states'] | True            |         |
    | stage_of_other_case                  | ended with order|         |
    | type_of_response['improper service'] | True            |         |
    | proper_service                       | False           |         |
    | type_of_response['default']          | False           |         |
  And I should see the phrase "Your situation is complicated. You may want to talk to a lawyer. If you do not respond to the Alaska case, the Alaska judge may enter a custody order."
  And I should see the phrase "This could be very complicated if you already have a custody order in another state. It is best to file a Motion to Dismiss your Alaska case to tell the Alaska judge (1) about the order from the other state and (2) that you were not served properly"
  And I should see the phrase "File a copy of the final orders from the other state, and any other documents that support your request."
    And I take a screenshot

@row2
Scenario: Row #2 – No improper service, no default (simple)
  Given I start the interview at "dismiss_step_test.yml"
    And I get to the question id "final screen" with this data:
    | var                                  | value           | trigger |
    | user_need                            | answer custody  |         |
    | type_of_response['case in 2 states'] | True            |         |
    | stage_of_other_case                  | ended with order|         |
    | type_of_response['improper service'] | False           |         |
    | type_of_response['default']          | False           |         |
  And I should see the phrase "If the case in the other state is over and the other court issued final orders, you can file a Motion to Dismiss your Alaska case."
  And I should see the phrase "File a copy of the final orders from the other state, and any other documents that support your request."
    And I take a screenshot

@row3
Scenario: Row #3 – Improper service flagged but properly served (simple)
  Given I start the interview at "dismiss_step_test.yml"
    And I get to the question id "final screen" with this data:
    | var                                  | value           | trigger |
    | user_need                            | answer custody  |         |
    | type_of_response['case in 2 states'] | True            |         |
    | stage_of_other_case                  | ended with order|         |
    | type_of_response['improper service'] | True            |         |
    | proper_service                       | True            |         |
    | type_of_response['default']          | False           |         |
  And I should see the phrase "If the case in the other state is over and the other court issued final orders, you can file a Motion to Dismiss your Alaska case."
  And I should see the phrase "File a copy of the final orders from the other state, and any other documents that support your request."
    And I take a screenshot

@row4
Scenario: Row #4 – Default path & not properly served (complicated with (1)/(2))
  Given I start the interview at "dismiss_step_test.yml"
    And I get to the question id "final screen" with this data:
    | var                                  | value           | trigger |
    | user_need                            | answer custody  |         |
    | type_of_response['case in 2 states'] | True            |         |
    | stage_of_other_case                  | ended with order|         |
    | type_of_response['improper service'] | False           |         |
    | proper_service                       | False           |         |
    | type_of_response['default']          | True            |         |
  And I should see the phrase "Your situation is complicated. You may want to talk to a lawyer. If you do not respond to the Alaska case, the Alaska judge may enter a custody order."
  And I should see the phrase "This could be very complicated if you already have a custody order in another state. It is best to file a Motion to Dismiss your Alaska case to tell the Alaska judge (1) about the order from the other state and (2) that you were not served properly"
  And I should see the phrase "File a copy of the final orders from the other state, and any other documents that support your request."
    And I take a screenshot

@row5
Scenario: Row #5 – Default path & properly served (complicated simple nested)
  Given I start the interview at "dismiss_step_test.yml"
    And I get to the question id "final screen" with this data:
    | var                                  | value           | trigger |
    | user_need                            | answer custody  |         |
    | type_of_response['case in 2 states'] | True            |         |
    | stage_of_other_case                  | ended with order|         |
    | type_of_response['improper service'] | False           |         |
    | proper_service                       | True            |         |
    | type_of_response['default']          | True            |         |
  And I should see the phrase "Your situation is complicated. You may want to talk to a lawyer. If you do not respond to the Alaska case, the Alaska judge may enter a custody order."
  And I should see the phrase "This could be very complicated if you already have a custody order in another state. It is best to file a Motion to Dismiss your Alaska case to tell the Alaska judge about the order from the other state"
  And I should see the phrase "File a copy of the final orders from the other state, and any other documents that support your request."
    And I take a screenshot
