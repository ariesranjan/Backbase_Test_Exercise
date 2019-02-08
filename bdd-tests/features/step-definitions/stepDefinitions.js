const chai = require("chai");
const { Given, When, Then } = require("cucumber");

const Locator = require("./getLocators");

let randomNumber = Math.floor(Math.random() * 100000 + 1);
randomNumber = randomNumber.toString();
console.log("random number is: ", randomNumber);

Given(/^I open the application "(.*)" url$/, (url) => {
  browser.url(url);
});

Then(/^I should see "(.*)" element is present$/, (selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.isExisting(selector);
  chai.expect(elementPresent).to.equal(true);
});

When(/^I click on "(.*)" element$/, (selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(5000);
  browser.click(selector);
});

When(/^I enter "(.*)" in "(.*)" field$/, (value, selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(5000);
  browser.setValue(selector, value);
});

When(/^I enter computer name "(.*)" in "(.*)" field in lower case$/, (value, selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(5000);
  browser.setValue(selector, `${value}${randomNumber}`.toLowerCase());
});

When(/^I enter computer name as "(.*)" in "(.*)" field$/, (value, selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(5000);
  browser.setValue(selector, `${value}${randomNumber}`);
});

Then(/^I should see computer name "(.*)" as "(.*)"$/, (selector, expectedValue) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(10000);
  var availableText = browser.getText(selector);
  chai.expect(`${expectedValue}${randomNumber}`).to.equal(availableText);
});

Then(/^I should see "(.*)" same as "(.*)"$/, (selector, expectedValue) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(10000);
  var availableText = browser.getText(selector);
  chai.expect(expectedValue).to.equal(availableText);
});

Then(/^I should not see "(.*)" same as "(.*)"$/, (selector, expectedValue) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(10000);
  var availableText = browser.getText(selector);
  chai.expect(expectedValue).to.equal(availableText);
});

Then(/^I should see "(.*)" as "(.*)" with computer name as "(.*)"$/, (selector, confirmationText, computerName) => {
  selector = Locator.getLocator(selector);
  let expectedValue = confirmationText.replace("name", `${computerName}${randomNumber}`);
  console.log("expected value is: ", expectedValue);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(10000);
  var availableText = browser.getText(selector);
  chai.expect(expectedValue).to.equal(availableText);
});

When(/^I select "(.*)" from "(.*)" drop down$/, (value, selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(5000);
  browser.selectByVisibleText(selector, value);
});

When(/^I create computer with name as "(.*)", Introduced date as (.*), Disncontinued Date as (.*) and Company Name as (.*)$/, (computerName, introducedDate, discontinuedDate, company) => {
  let addANewComputerButton = Locator.getLocator("AddANewComputer");
  let computerNameField = Locator.getLocator("ComputerName");
  let introducedDateField = Locator.getLocator("IntroducedDate");
  let discontinuedDateField = Locator.getLocator("DiscontinuedDate");
  let companyDropDown = Locator.getLocator("CompanyDropdown");
  let createThisComputerButton = Locator.getLocator("CreateThisComputer");
  const elementPresent = browser.element(addANewComputerButton);
  elementPresent.waitForExist(5000);
  browser.click(addANewComputerButton)
         .setValue(computerNameField, `${computerName}${randomNumber}`)
         .setValue(introducedDateField, introducedDate)
         .setValue(discontinuedDateField, discontinuedDate)
         .selectByVisibleText(companyDropDown, company)
         .click(createThisComputerButton);
});

When(/^I delete the created computer named as "(.*)"$/, (computerName) => {
  let searchedComputerNameLink = Locator.getLocator("NameOfComputerInSearchTable");
  let deleteComputerButton = Locator.getLocator("DeleteThisComputer");
  let searchField = Locator.getLocator("SearchField");
  let searchButton = Locator.getLocator("FilterByName");

  browser.url("http://computer-database.herokuapp.com/computers")
         .setValue(searchField, `${computerName}${randomNumber}`)
         .click(searchButton)
         .click(searchedComputerNameLink)
         .click(deleteComputerButton);
});

When(/^I clear "(.*)" field$/, (selector) => {
  selector = Locator.getLocator(selector);
  const elementPresent = browser.element(selector);
  elementPresent.waitForExist(5000);
  browser.clearElement(selector);
});
