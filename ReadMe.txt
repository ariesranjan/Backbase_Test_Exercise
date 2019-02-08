=========>>>>>>Framework Details<<<<<<<=================

PRE-REQUISITE:>>>>>>>>>>
Install NODE Version: 8.10.0
        NPM Version: 5.6.0

Globally Installed Module:>>>>>>>>>>>
Run the following commands for globally installed the node modules:
-- $ npm install webdriverio@4.12.0 -g
-- $ npm install chromedriver@2.38.3 -g
-- $ npm install wdio-cucumber-framework@2.1.0 -g
-- $ npm install gulp@3.9.1 -g

Copy and paste the project folder in your desired location
Run the following command to install the node modules after going to the package.json location
-- npm install
Make sure all node modules mentioned in package.json are installed

Open cmd on 'backbaseTestFramework' location and run command 'gulp cucumber' to execute the feature files available in 'featureFiles' folder

--------Structure of the Framework----------
Configuration file is under conf folder where all configuration like browser, feature file location and step defintions are mentioned
Features file for different scenarios are mentioned under features/featureFiles/
Step Definitions for corresponding feature files are mentioned in step-defintions folder
All element locators are available in locators/locators.yml file
All json and html reports are available in output folder

