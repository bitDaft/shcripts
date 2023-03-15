"use strict";

const puppeteer = require("puppeteer");
const request_client = require("request-promise-native");

const site_url = process.argv[2];

// console.log(site_url)

const main = async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  const result = [];

  await page.setRequestInterception(true);

  let finalUrl = "";
  let title = "";

  page.on("request", (request) => {
    if (finalUrl) return;
    request_client({
      uri: request.url(),
      resolveWithFullResponse: true,
    })
      .then((response) => {
        if (finalUrl) return;
        const request_url = request.url();
        const request_headers = request.headers();
        const request_post_data = request.postData();
        const response_headers = response.headers;
        const response_size = response_headers["content-length"];
        const response_body = response.body;

        result.push({
          request_url,
          request_headers,
          request_post_data,
          response_headers,
          response_size,
          response_body,
        });

        if (!title && ~response_body.indexOf("<title>")) {
          let startIdx = response_body.indexOf("<title>");
          let endIdx = response_body.indexOf(" - YouTube</title>");
          title = response_body.slice(startIdx + 7, endIdx);
          title = title.replace(/[\/\-\(\)]/ig, '');
          console.log(title);
        }
        if (
          ~request_url.indexOf("googlevideo.com/videoplayback") &&
          ~request_url.indexOf("mime=audio") &&
          !finalUrl
        ) {
          // console.log(request_url);
          let t = new URL(request_url);
          t.searchParams.delete("range");
          finalUrl = t.toString();
          console.log(finalUrl);
          process.exit(0);
        }
        request.continue();
      })
      .catch((error) => {
        // console.error(error);
        request.abort();
      });
  });

  await page.goto(site_url, {
    waitUntil: "networkidle0",
  });

  await browser.close();
  process.exit(0);
};

try {
  new URL(site_url);
} catch (e) {
  site_url = "";
}
if (site_url) {
  main();
} else {
  process.exit(1);
}
