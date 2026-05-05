{
  "name": "Make external YouTube shorts regular videos",
  "description": "Make external shorts regular videos: redirect from /shorts to /watch.",
  "version": "1.1",
  "manifest_version": 3,
  "permissions": ["webNavigation"],
  "background": {
    "type": "module"
  } + ({
    "chrome": {
      "service_worker": "worker.js"
    },
    "firefox": {
      "scripts": ["worker.js"]
    }
  }[$browser] // error("Unknown browser type: " + ($browser | @json) + ". Expected \"chrome\" or \"firefox\".")),
  "icons": {
    "128": "icon.png"
  },
  "homepage_url": "https://github.com/alurm/make-external-youtube-shorts-regular-videos",
  "browser_specific_settings": {
    "gecko": {
      "data_collection_permissions": {
        "required": ["none"]
      },
      "id": "@make-external-youtube-shorts-regular-videos.alurm"
    }
  }
}
