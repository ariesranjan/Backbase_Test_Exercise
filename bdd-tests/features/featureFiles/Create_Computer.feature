Feature: Creating New Computer

Background: Opening application url
    Given I open the application "http://computer-database.herokuapp.com/computers" url

Scenario: TC_001 - Verify that 'Add A New Computer' button is dispyaed after launching the application url.

    Then I should see "AddANewComputer" element is present

Scenario: TC-002 - Verify that 'Add a Computer' page is displayed as follows by clicking on 'Add a New Computer' button:Computer Name text field, Introduced Date Text Field, Discontinued Date Text Field, Company Drop Down, Create this Computer button, Cancel Button
    
    When I click on "AddANewComputer" element
    Then I should see "ComputerName" element is present
    And I should see "IntroducedDate" element is present
    And I should see "DiscontinuedDate" element is present
    And I should see "CompanyDropdown" element is present
    And I should see "CreateThisComputer" element is present
    And I should see "CancelButton" element is present

Scenario: TC-003 - Verify that user is redirected to home page by clicking on 'Cancel' button at Add A Computer page.

    When I click on "AddANewComputer" element
    And I click on "CancelButton" element
    Then I should see "FilterByName" element is present

Scenario Outline: TC-004 - Verify that Computer is created by clicking on 'Create this Computer' button after entering value in 'Computer Name field and keeping other fields blank.

    When I click on "AddANewComputer" element
    And I enter computer name as "<Computer Name>" in "ComputerName" field
    And I click on "CreateThisComputer" element
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"

  Examples:
    | Computer Name | 
    | Lenovo T440   |
    | lEnovot440    |
    | Lenovo#230    |
    | 440           |
    |!@#Lenovo      |

Scenario: TC_005 - Verify that Computer Name field is highlighted when user clicks on 'Create this Computer' button.

    When I click on "AddANewComputer" element
    And I click on "CreateThisComputer" element
    Then I should see "ComputerNameError" element is present

Scenario Outline: TC_006 - Verify that 'Introduced Date' field is highlighted and Computer is not created when entered date not valid or not in YYYY-MM-DD.

    When I click on "AddANewComputer" element
    And I enter "Lenovo T30" in "ComputerName" field
    And I enter "<Date>" in "IntroducedDate" field
    And I click on "CreateThisComputer" element
    Then I should see "IntroducedDateError" element is present

  Examples:
    | Date     |
    |2018-1212 |
    |2018-26-12|
    |AB12-12-12|
    |YYYY-MM-DD|

Scenario Outline: TC_007 - Verify that 'Discontinued Date' field is highlighted and Computer is not created when entered numeric value is not in YYYY-MM-DD format.

    When I click on "AddANewComputer" element
    And I enter "Lenovo T30" in "ComputerName" field
    And I enter "<Date>" in "DiscontinuedDate" field
    And I click on "CreateThisComputer" element
    Then I should see "DiscontinuedDateError" element is present

  Examples:
    | Date     |
    |2018-1212 |
    |2018-26-12|
    |AB12-12-12|
    |YYYY-MM-DD|

Scenario Outline: TC_008 - Verify that computer is created by clicking on 'Create this Computer' button after entering valid value in 'Computer Name' field and Introduced Date field.

    When I click on "AddANewComputer" element
    And I enter computer name as "<Computer Name>" in "ComputerName" field
    And I enter "2018-12-12" in "IntroducedDate" field
    And I click on "CreateThisComputer" element
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"

 Examples:
   |Computer Name |
   | Lenovo T30   |    

Scenario Outline: TC_009 - Verify that computer is created by clicking on 'Create this Computer' button after entering value in 'Computer Name' field and Discontinued Date field.

    When I click on "AddANewComputer" element
    And I enter computer name as "<Computer Name>" in "ComputerName" field
    And I enter "2018-12-12" in "DiscontinuedDate" field
    And I click on "CreateThisComputer" element
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
Examples:
   |Computer Name |
   | Lenovo T31   |

Scenario Outline: TC_010 - Verify that computer is created by clicking on 'Create this Computer' button after entering valid value in 'Computer Name' field and selecting Company name from Company drop down.

    When I click on "AddANewComputer" element
    And I enter computer name as "<Computer Name>" in "ComputerName" field
    And I select "Lenovo Group" from "CompanyDropdown" drop down
    And I click on "CreateThisComputer" element
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"
Examples:
   |Computer Name |
   | Lenovo T32   |

Scenario Outline: TC_011 - Verify that computer is created by clicking on 'Create this Computer' button after entering valid values in all the fields.

    When I click on "AddANewComputer" element
    And I enter computer name as "<Computer Name>" in "ComputerName" field
    And I enter "2017-12-12" in "IntroducedDate" field
    And I enter "2018-12-12" in "DiscontinuedDate" field
    And I select "Lenovo Group" from "CompanyDropdown" drop down
    And I click on "CreateThisComputer" element
    Then I should see "ConfirmationText" as "Done! Computer name has been created" with computer name as "<Computer Name>"

 Examples:
   |Computer Name |
   | Lenovo T33   |