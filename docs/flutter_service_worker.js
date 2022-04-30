'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "8525607c49970e494470f0361af896c7",
"assets/assets/fonts/Nunito-Bold.ttf": "d959f749429d84048a4b43de46af789d",
"assets/assets/fonts/Nunito-VariableFont_wght.ttf": "f057ac6ef231833f19d1e9622fa346bd",
"assets/assets/images/funai.png": "76030919b368fc6dc25cebcd02364ca6",
"assets/assets/images/fundos/fu.png": "70eca5cf3138bcbb230dabb6a676ea6a",
"assets/assets/images/fundos/fundo-blue-dark.png": "d4421247a4fcc3bde5c9ee7cea024098",
"assets/assets/images/fundos/fundo-blue.png": "dff9d578fc0c3a408b0ee66457081dcd",
"assets/assets/images/fundos/fundo-green.png": "1e29969b79dfe7bc7a9e7c7aa37b3ff8",
"assets/assets/images/fundos/fundo-grey-dark.png": "31bed3dce3eee437727f9d0888c1bf57",
"assets/assets/images/fundos/fundo-grey-light.png": "d30d5cec711f5b845c6edfaeb8e91259",
"assets/assets/images/fundos/fundo-red.png": "93faa81f7bb51b61e58cf6e5597db29f",
"assets/assets/images/fundos/fundoWhite.png": "1a576823e2f75fbc81d463e023fd719b",
"assets/assets/images/fundos/teste.png": "e5b2909f2682dcef80c433a185623e56",
"assets/assets/images/kri-rowahtuze.png": "eacb12d68a6435f88a56987aa80404b4",
"assets/assets/images/logo/LOGO-APP.png": "c8930e1e61070e2ea10d87359f79b364",
"assets/assets/images/profnit.png": "9f9ad006559f0a861951cbb65fc81275",
"assets/assets/images/uft.png": "a83a35cfcd16f6bff805a3bf4abff049",
"assets/assets/sonds/background/01.mp3": "ca2a91bbbb5d75d381a68e0c5e1044ff",
"assets/assets/sonds/correct.mp3": "e7f8eb2e3e9d68730a0eb62d558ea53c",
"assets/assets/sonds/incorrect.mp3": "b0d95e024973d951d3c8607510ca8357",
"assets/FontManifest.json": "ec4599934c4e37385c69229471cc8c4a",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "67d7ef2d7446befe280ad66bfaeb13f9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_tabler_icons/assets/fonts/tabler-icons.ttf": "7a74f61f77cd9424f01f2a03922cd195",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6a450b51f93f6647ccbadd6be71b5e08",
"/": "6a450b51f93f6647ccbadd6be71b5e08",
"main.dart.js": "395ba8d2ab4d882fca5739071035f2ff",
"manifest.json": "17794534294e38d8d6dda10668abcd20",
"version.json": "565bfdb4dbc8aacf40282ecdd6183fba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
