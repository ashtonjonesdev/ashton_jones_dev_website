'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "fb362c84e7f836d2fa1c477af09ff638",
"/": "fb362c84e7f836d2fa1c477af09ff638",
"main.dart.js": "ce9e06ef54e52fbff86dcee4b2ac096f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "05bc4b9506ee2ce5e84929034c262cd0",
"assets/images/flutter_logo.png": "8ba1d5b022cd7f5999bea3085e87ceb0",
"assets/images/_reply.gif": "6d2d690bd95295f79907d465368de9c4",
"assets/images/associate_android_developer_badge_google_play_store_cover.png": "477d5cc80617c999669e4829c4d32888",
"assets/images/google_play_store_badge.png": "db9b21a1c41f3dcd9731e1e7acfdbb57",
"assets/images/dev.to_logo.png": "37034bf3878730379aa1744071c129ac",
"assets/images/ash.png": "303142a5af8c30472874e877404bd9de",
"assets/images/ashton_picture.jpg": "3925447b22ad6e9b2ca6d67e97607c38",
"assets/images/associate_android_developer_badge.png": "df3fe90a367d1da9b54e88fb0183004c",
"assets/images/ProfilePicture.jpg": "703fa2932ea2b2f8180a59e1a60d811d",
"assets/images/apple_app_store.png": "b38efdc6402c8d6d6b9022f62ac6ce97",
"assets/images/google_certified_android_developer.png": "04bcb72e0b6971833b0661711195a31e",
"assets/images/google_play_icon.png": "89ab33b17f93e2423eefddb61229be89",
"assets/images/torchdemo.gif": "a2a6eed28712e8febf3fd602bfa16da9",
"assets/images/github.png": "d22ee3727a7216019c3848df6eafa024",
"assets/images/associate_android_developer_badge_small.png": "8dee3fe493bc1828e00b13cc21391f4a",
"assets/images/java.png": "0faf5c36546797ed0cd9ed6ac7e8b148",
"assets/images/tallahassee_skyline.jpg": "e8849d83e85c9f6fc75f758b4802a44a",
"assets/images/associate_android_developer_badge_large.png": "2bf62e5b54e03a69fb2c3f35e97cbd72",
"assets/images/reply_title.png": "88886b8f47f94c5b96154d37364c94f6",
"assets/images/medium_light.png": "bd516690c99267a778885736015befe8",
"assets/images/i_did_not_start_living_until_25.jpg": "7d808435762919383470d3fbe3b1fe13",
"assets/images/small_placeholder.png": "90da231bf10044ffe802d84829c1579e",
"assets/images/medium.png": "fb86f4060325caef8ea1f0fad0d25f40",
"assets/images/associate-android-developer-badge-medium.png": "df3fe90a367d1da9b54e88fb0183004c",
"assets/images/reply_app_icon.png": "26e49e2ccf9822dfac6903c443b2e4ae",
"assets/images/torch_app_icon.png": "0b110170a64b85ecd50a8ab8c92a3655",
"assets/images/androidify.gif": "e4af35b9b2412ca5a3c49e09241be796",
"assets/images/dart_logo.png": "c121e58b84cebb6093a2f7f9f8870a3e",
"assets/images/on_2019.jpg": "4bf338c6d8190a627ad8f3de05b9f347",
"assets/images/twitter.png": "8f35a40403a84631c4125c4f1859c7a6",
"assets/images/linkedin.png": "926e2dcf5ab4220a359867614556df68",
"assets/images/firestore_basics_android.png": "77605c9610becf0a9a08c86a0d42cdf4",
"assets/images/cool_profile_picture.jpg": "d4f84423aaf333508be27721cc158bf4",
"assets/images/google_android_developer_certification.png": "04bcb72e0b6971833b0661711195a31e",
"assets/images/android_logo.png": "ab30a3d6b99508c6001e21b5618f8da1",
"assets/images/facebook.png": "021ada146ffb7c1753557ff29618d04c",
"assets/images/firestore_basics_flutter.png": "df620840e4488e8a302828b36f75d3a2",
"assets/images/dart.png": "6b1b8074c75f0c0250b34642f12a1dd4",
"assets/images/reply.gif": "595c4854de2a58c9c8746cbd3fa84e5b",
"assets/images/torch_title.png": "52188f89d2c119859da230ce6a6d9787",
"assets/images/associate_android_developer_certification.pdf": "19311dabd10fbd3e1dd45157c7eba626",
"assets/images/medium_icon.jpg": "a1b5b91f2f6f4d2fa9294f6a05771a1b",
"assets/images/java_logo.png": "b72ab072a9c64a4f233873e627b9bfb5",
"assets/AssetManifest.json": "a187fd588349dad716fea835b69780cd",
"assets/NOTICES": "2c14d744b151058f1053418cb1f2391f",
"assets/FontManifest.json": "ab310715c29abd30b1eb1b6c626d8ec7",
"assets/fonts/MaterialIcons-Regular.otf": "a68d2a28c526b3b070aefca4bac93d25",
"assets/assets/computer_programmer.flr": "3ec5cd241c72ef914a76be34056fa23e",
"assets/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411"
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
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      // Provide a 'reload' param to ensure the latest version is downloaded.
      return cache.addAll(CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'reload'});
        return response || fetch(modifiedRequest).then((response) => {
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
    return self.skipWaiting();
  }

  if (event.message === 'downloadOffline') {
    downloadOffline();
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
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
