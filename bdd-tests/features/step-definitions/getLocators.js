var yaml = require("js-yaml");
 var fs = require("fs");
 var ObjectRepo = yaml.load(fs.readFileSync("bdd-tests/locators/locators.yml"));

/**
 * Loading the locator of the element from YAML file
 * @param {*} sLogicalName 
 */
function getLocator(sLogicalName){
    try {
        const LocatorString = "ObjectRepo." + sLogicalName;
        return eval("(" + LocatorString + ')');
    }
    catch(err){
        return undefined;
    }
}

exports.getLocator  = getLocator;