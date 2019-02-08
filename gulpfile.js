var gulp = require("gulp");
var reporter = require("multiple-cucumber-html-reporter");
const runSequence = require("run-sequence");
const mkdirp = require("mkdirp");
const rimraf = require("rimraf");

var plugins = {
  path: require("path"),
  wdio: require("gulp-webdriver"),
  exec: require("child_process").exec
};

var seleniumServer, task;

/**
 * Handing over all the configuration files to wdio so that mentioned configurations could be picked for execution
 */
gulp.task("wdio", function() {
  var isWin = /^win/.test(process.platform);
  var cmd = isWin ? "wdio.cmd" : "wdio";

  return gulp.src("bdd-tests/conf/*.js").pipe(
    plugins.wdio({
      wdioBin: plugins.path.join(__dirname, "node_modules", ".bin", cmd)
    })
  );
});

/**
 * Start the selenium standalone server
 */
gulp.task("selenium", function() {
  var isWin = /^win/.test(process.platform);
  var executable = isWin
    ? "node_modules/chromedriver/lib/chromedriver/chromedriver.exe"
    : "node_modules/chromedriver/bin/chromedriver";
  var command =
    "java -jar ./node_modules/selenium-server-standalone-jar/jar/selenium-server-standalone-2.53.0.jar -log ../seleniumLog.txt -Dwebdriver.chrome.driver=" +
    plugins.path.resolve(__dirname, executable);
  seleniumServer = plugins.exec(command, function() {
    seleniumServer = null;
  });
});

/**
 * Creating the directories for json report and html report if not present and deleting any existing filed under these folder
 */
gulp.task("prepareReportFolders", function() {
  mkdirp.sync("bdd-tests/output/jsonReport");
  mkdirp.sync("bdd-tests/output/htmlReport");
  rimraf.sync("bdd-tests/output/jsonReport/*");
  rimraf.sync("bdd-tests/output/htmlReport/*");
});

/**
 * generate the html report using the json report generated by WDIO runner
 */
gulp.task("htmlReport", function() {
  reporter.generate({
    jsonDir: "./bdd-tests/output/jsonReport/",
    reportPath: "./bdd-tests/output/htmlReport/"
  });
});

/**
 * execute the task in sequence for Feature File execution
 * Preparing report folders as mentioned above in 'prepareReportFolders' task,
 * Starting selenium standalone server,
 * Running wdio runner for script executions,
 * Generating html reports
 */
gulp.task("cucumber", function(cb) {
  runSequence(
    "prepareReportFolders",
    "selenium",
    "wdio",
    "htmlReport",
    function() {
      if (seleniumServer) {
        process.kill(seleniumServer.pid, "SIGINT");
      }
      cb();
      process.exit(0);
    }
  );
});