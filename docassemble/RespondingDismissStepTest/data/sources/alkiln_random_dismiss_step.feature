Feature: Random tests

Scenario: The scenario
  Given ALKiln will make 10 constrained random answers tests
  And I start the interview at "dismiss_step_test.yml"
  And I wait 1 second
  Then ALKiln will reach any of the question ids "final screen" with:
    | var                                 | possible values                        |
    | type_of_response['default']         | True;; False                           |
    | type_of_response['improper service']| True;; False                           |
    | type_of_response['ak custody case'] | True;; False                           |
    | type_of_response['wrong state']     | True;; False                           |
    | type_of_response['case in 2 states']| True;; False                           |
    | stage_of_other_case                 | still going;; ended with order;; ended with no order |
    | jurisdiction                        | True;; False                           |
    | proper_service                      | True;; False                           |
  And I take a picture
