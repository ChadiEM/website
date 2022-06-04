const fs = require("fs");
const lighthouse = require("lighthouse");
const chromeLauncher = require("chrome-launcher");

(async () => {
  const chrome = await chromeLauncher.launch({ chromeFlags: ["--headless"] });
  const options = {
    logLevel: "info",
    output: "json",
    // onlyCategories: ["accessibility"],
    port: chrome.port,
  };
  const runnerResult = await lighthouse("http://localhost:3000", options);

  // `.report` is the HTML report as a string
  const reportHtml = runnerResult.report;
  fs.writeFileSync("lhreport.json", reportHtml);

  // `.lhr` is the Lighthouse Result as a JS object
  console.log("Report is done for", runnerResult.lhr.finalUrl);
  console.log(runnerResult.lhr.categories.accessibility.score);
  console.log(runnerResult.lhr.categories.performance.score);
//   console.log(
//     "Performance score was",
//     runnerResult.lhr.categories.performance.score * 100
//   );

  await chrome.kill();
})();
