Feature: Searching exisiting computer

Background: Search functionality for already created computer
    Given I open the application "http://computer-database.herokuapp.com/computers" url

Scenario Outline: TC_012 - User is able to search existing computer

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see computer name "NameOfComputerInSearchTable" as "<Computer Name>"
    Then I should see "IntroducedDateInSearchTable" same as "12 Dec 1988"
    Then I should see "DiscontinuedDateInSearchTable" same as "12 Dec 1999"
    Then I should see "CompanyNameInSearchTable" same as "Lenovo Group"
    When I delete the created computer named as "<Computer Name>"
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"

 Examples:
    | Computer Name | 
    | Lenovo        | 


Scenario: TC_013 - Verify that no results are displayed when user enters computer name which does not exist.

    When I enter "#4%test" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see "PageHeading" same as "No computers found"

Scenario Outline: TC_014 - Verify that searching of computer name is not case sensitive.

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name "<Computer Name>" in "SearchField" field in lower case
    And I click on "FilterByName" element
    Then I should see computer name "NameOfComputerInSearchTable" as "<Computer Name>"
    Then I should see "IntroducedDateInSearchTable" same as "12 Dec 1988"
    Then I should see "DiscontinuedDateInSearchTable" same as "12 Dec 1999"
    Then I should see "CompanyNameInSearchTable" same as "Lenovo Group"
    When I delete the created computer named as "<Computer Name>"
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"

 Examples:
    | Computer Name | 
    | LEnOvo        | 

Scenario Outline: TC_015 - Verify that search results are only displayed when the entered search string is partial/exact match of the name starting with the entered string. 

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see computer name "NameOfComputerInSearchTable" as "<Computer Name>"
    When I enter computer name as "Lenovo Think" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see "PageHeading" same as "No computers found"

 Examples:
    | Computer Name | 
    | Lenovo        | 

