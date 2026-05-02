// We don't listen on onHistoryStateUpdated, because we only care about externally-linked shorts.
chrome.webNavigation.onBeforeNavigate.addListener(
  async ({ frameId, tabId, url }) => {
    // Let's not touch subframes.
    if (frameId !== 0) return;

    url = new URL(url);

    // Fail if the URL's path doesn't look like /shorts/<id> with an optional / at the end.
    const match = url.pathname.match(/^\/shorts\/([^/]+)\/?$/);
    if (!match) return;

    url.pathname = "/watch";
    url.searchParams.set("v", match[1]);

    await chrome.tabs.update(tabId, { url: url.toString() });
  },
  {
    url: ["www.youtube.com", "youtube.com", "m.youtube.com"].map(
      (hostEquals) => ({
        hostEquals,
        pathPrefix: "/shorts/",
      }),
    ),
  },
);
