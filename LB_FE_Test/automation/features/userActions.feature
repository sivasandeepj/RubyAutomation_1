Feature: Validate User Actions

  Scenario: User is able to update his profile
    Given User is on the landing-page
    When User "logs in" as "Siva"
    And navigates to "User Info" from "settings"
    And "Siva" "Edits" information for "all" fields
    Then information regarding "all fields" is "updated"

  Scenario: User is able to check operations with result as pass
    Given User is on the landing-page
    When User "logs in" as "Siva"
    And navigates to "Operations" from "account_tree"
    And filters "Result" as "Pass"
    Then there are "No" operations to display
    #Then On expanding "Operations" there are "no" Operations displayed
