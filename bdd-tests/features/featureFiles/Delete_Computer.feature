Feature: Deleting existing computer details

Background: Opening application url
    Given I open the application "http://computer-database.herokuapp.com/computers" url
    
Scenario Outline: TC_020-TC_021-TC_022 - Verify that Delete this Computer button is displayed & Verify that computer is deleted by clicking on 'Delete this Computer' button & Verify that user is unable to search deleted computer.

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group 
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    And I click on "NameOfComputerInSearchTable" element
    Then I should see "PageHeading" same as "Edit computer"
    And I should see "DeleteThisComputer" element is present
    When I click on "DeleteThisComputer" element
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see "PageHeading" same as "No computers found"

 Examples:
    | Computer Name     | 
    | Lenovo            | 