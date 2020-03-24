finicky.setDefaultBrowser('com.apple.Safari');

// Open dev links in chrome
finicky.onUrl(function(url, opts) {
	if (
		url.match(
			/^https?:\/\/(.*\.docker|.*(\.qa)?\.cudaops\.com|localhost)(\:\d+)?/
		)
	) {
		return {
			bundleIdentifier: 'com.google.Chrome',
		};
	}
});

// Open JIRA, etc. in safari tech preview
finicky.onUrl(function(url, opts) {
	if (url.match(/^https?:\/\/(stash|bugs|bccbuild)\.cudaops\.com/)) {
		return {
			url: url.replace(/(stash|bugs)\.cudaops\.com/, '$1.cudawork.com'),
			bundleIdentifier: 'com.apple.SafariTechnologyPreview',
		};
	}
});
