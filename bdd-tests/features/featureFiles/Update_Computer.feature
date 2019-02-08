Feature: Updating existing computer details

Background: Opening application url
    Given I open the application "http://computer-database.herokuapp.com/computers" url
    
Scenario Outline: TC_016 - Verify that updated details are not saved when user clicks on Cancel button at Edit Details page.

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group 
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    And I click on "NameOfComputerInSearchTable" element
    Then I should see "PageHeading" same as "Edit computer"
    When I enter "<Updated Computer Name>" in "ComputerName" field
    And I enter "2017-11-12" in "IntroducedDate" field
    And I enter "2018-11-12" in "DiscontinuedDate" field
    And I select "Lenovo Group" from "CompanyDropdown" drop down
    And I click on "CancelButton" element
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see computer name "NameOfComputerInSearchTable" as "<Computer Name>"
    Then I should see "IntroducedDateInSearchTable" same as "12 Dec 1988"
    Then I should see "DiscontinuedDateInSearchTable" same as "12 Dec 1999"
    Then I should see "CompanyNameInSearchTable" same as "Lenovo Group"
    When I delete the created computer named as "<Computer Name>"
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"

 Examples:
    | Computer Name | Updated Computer Name |
    | Lenovo        | Lenovo T           |

Scenario Outline: TC_017 - Verify that updated details are saved when user clicks on 'Save this Computer' button.

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group 
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    And I click on "NameOfComputerInSearchTable" element
    Then I should see "PageHeading" same as "Edit computer"
    When I enter computer name as "<Updated Computer Name>" in "ComputerName" field
    And I enter "2017-11-12" in "IntroducedDate" field
    And I enter "2018-11-12" in "DiscontinuedDate" field
    And I select "Lenovo Group" from "CompanyDropdown" drop down
    And I click on "SaveThisComputer" element
    Then I should see "ConfirmationText" as "Done! Computer name has been updated" with computer name as "<Updated Computer Name>"
    When I enter computer name as "<Updated Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    Then I should see computer name "NameOfComputerInSearchTable" as "<Updated Computer Name>"
    Then I should see "IntroducedDateInSearchTable" same as "12 Nov 2017"
    Then I should see "DiscontinuedDateInSearchTable" same as "12 Nov 2018"
    Then I should see "CompanyNameInSearchTable" same as "Lenovo Group"
    When I delete the created computer named as "<Updated Computer Name>"
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"

 Examples:
    | Computer Name | Updated Computer Name |
    | Lenovo        | Lenovo T           |

Scenario Outline: TC_018 - Verify that Computer name field is highlighted when user removes name from created computer and clicks on Save this Computer button.
    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group 
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    And I click on "NameOfComputerInSearchTable" element
    Then I should see "PageHeading" same as "Edit computer"
    When I clear "ComputerName" field
    And I click on "SaveThisComputer" element
    Then I should see "ComputerNameError" element is present
    When I delete the created computer named as "<Computer Name>"
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"

 Examples:
    | Computer Name | Updated Computer Name |
    | Lenovo        | Lenovo T           |


Scenario Outline: TC_019 - Verify that Introduced Date and Discontinued Date fields are highlighted when user enters incorrect format of date and clicks on Save this Computer button.

    When I create computer with name as "<Computer Name>", Introduced date as 1988-12-12, Disncontinued Date as 1999-12-12 and Company Name as Lenovo Group 
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
    When I enter computer name as "<Computer Name>" in "SearchField" field
    And I click on "FilterByName" element
    And I click on "NameOfComputerInSearchTable" element
    Then I should see "PageHeading" same as "Edit computer"
    And I enter "2018-1212" in "IntroducedDate" field
    And I click on "SaveThisComputer" element
    Then I should see "IntroducedDateError" element is present
    When I enter "2018-12-12" in "IntroducedDate" field
    And I enter "2019-Dec-12" in "DiscontinuedDate" field
    And I click on "SaveThisComputer" element
    Then I should see "DiscontinuedDateError" element is present
    When I delete the created computer named as "<Computer Name>"
    Then I should see "ConfirmationText" same as "Done! Computer has been deleted"

 Examples:
    | Computer Name | Updated Computer Name |
    | Lenovo        | Lenovo T              |