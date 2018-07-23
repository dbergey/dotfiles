finicky.setDefaultBrowser('com.apple.Safari');

// Open dev links in chrome
finicky.onUrl(function(url, opts) {
    if (url.match(/^https?:\/\/(.*\.docker|.*(\.qa)?\.cudaops\.com|localhost)(\:\d+)?/)) {
      return {
        bundleIdentifier: "com.google.Chrome"
      };
    }
  });


// Open JIRA, etc. in safari tech preview
finicky.onUrl(function(url, opts) {
    if (url.match(/^https?:\/\/(stash|bugs)\.cudaops\.com/)) {
      return {
        bundleIdentifier: "com.apple.SafariTechnologyPreview"
      };
    }
  });
