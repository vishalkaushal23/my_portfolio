'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/10.webp": "814cd91c3ca93b37f0d03feff7d61b09",
"assets/2.png": "53c89a17ff11da6c70ac4c06ecb35d25",
"assets/3.png": "8c0c9ad8ce6a5b92b08b2bce3fd7924e",
"assets/5.webp": "9c775b7025df78fbd5f325fadcaafc18",
"assets/6.webp": "d320dbf015af05bc877714dc6d78acca",
"assets/7.png": "a2b2e5d7b8e0bf40b71c857fda324ae1",
"assets/8.webp": "83b3b3ebf90b63920be7b5b48b7cfb72",
"assets/9.webp": "31eae9b7bcaa8af87cc89549dea4a269",
"assets/Artworks_Images.png": "3400bead0bc6e58ee8eaf5c9805cab68",
"assets/AssetManifest.bin": "12ad00c7e142dcf3211ba682d221fc2b",
"assets/AssetManifest.bin.json": "9f03d2a388889b85ea2b694ed9e77f65",
"assets/AssetManifest.json": "3c473f14fb204196e31531c1a31994e1",
"assets/astro.png": "7bd128dc99f6b9f0c13b06c711fa6fc0",
"assets/Background%20Remover%20Image%20(1).png": "3f41f227ea438e2aac5358ffcd74ef4e",
"assets/brainy.png": "4f4ff881951e9e536b99db520062b8ab",
"assets/carcentro.png": "898452a7a6b894544986714d5acb7d8e",
"assets/coupanda.png": "052508a4b254e6f94e653c69a4b12882",
"assets/dribble.svg": "501e9c5b68b3a403e0f3865e3a024803",
"assets/email2.svg": "31d822281c9556614ce202ad00e8fbbc",
"assets/ffp.png": "bd4f1404b199273d85ba026c13d61eb9",
"assets/FlutterStack.png": "6eca91b2994ba62df2fbf2e48ea1cd87",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "8b2a6c21aad4c9e9ea19b73af4d75281",
"assets/footasylum.png": "d01931f1c483de3a3ed55d0bb75c05b0",
"assets/github.svg": "26f54b16aa06a3856c7dd85ee9296f81",
"assets/homecook.png": "ce62018da39b18518526a20ec58438fd",
"assets/homevyte.png": "ebe058b64d6c26834d7104f6dd858627",
"assets/jenny.png": "29f14677a7c4d79e83106cb249232913",
"assets/linkedln.svg": "7b6a698ce68cc755f0be59bfe95a0688",
"assets/logo.png": "af0b3f01c8a982f5bc5fb42bf4fb69a8",
"assets/mine.jpg": "383a395ba55e10559695d3363560dc34",
"assets/mini.png": "e7402dc68e1fe4ba771bff979bd7c746",
"assets/NOTICES": "db3de6a863286fa077c2096b2088a08e",
"assets/outspark.png": "c59592fa82f9773f0fd004f880cf2b22",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/play_store.png": "cb53f21750e681cb090e73d28d35e974",
"assets/prank.png": "64f1bc49f74b2f24a744839bcc15e805",
"assets/rapid.png": "3333c0cdd642cc0f5e0e9ab26caa7405",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/Spendify.png": "27f4d56e23f018169553f456aeecc020",
"assets/streamcamp.png": "facc707fad25e1ffbbdb37b45191b5f2",
"assets/times.png": "f752f9f31eb55265cd79889b89aee2fa",
"assets/touchpass.png": "9a10d6da7b0778bc72fe2a24a8866538",
"assets/umo.png": "49109bbf2e877d571a66f8f1f5cb063b",
"assets/web/assets/10.webp": "814cd91c3ca93b37f0d03feff7d61b09",
"assets/web/assets/2.png": "53c89a17ff11da6c70ac4c06ecb35d25",
"assets/web/assets/3.png": "8c0c9ad8ce6a5b92b08b2bce3fd7924e",
"assets/web/assets/5.webp": "9c775b7025df78fbd5f325fadcaafc18",
"assets/web/assets/6.webp": "d320dbf015af05bc877714dc6d78acca",
"assets/web/assets/7.png": "a2b2e5d7b8e0bf40b71c857fda324ae1",
"assets/web/assets/8.webp": "83b3b3ebf90b63920be7b5b48b7cfb72",
"assets/web/assets/9.webp": "31eae9b7bcaa8af87cc89549dea4a269",
"assets/web/assets/Artworks_Images.png": "3400bead0bc6e58ee8eaf5c9805cab68",
"assets/web/assets/astro.png": "7bd128dc99f6b9f0c13b06c711fa6fc0",
"assets/web/assets/Background%2520Remover%2520Image%2520(1).png": "3f41f227ea438e2aac5358ffcd74ef4e",
"assets/web/assets/brainy.png": "4f4ff881951e9e536b99db520062b8ab",
"assets/web/assets/carcentro.png": "898452a7a6b894544986714d5acb7d8e",
"assets/web/assets/coupanda.png": "052508a4b254e6f94e653c69a4b12882",
"assets/web/assets/dribble.svg": "501e9c5b68b3a403e0f3865e3a024803",
"assets/web/assets/email2.svg": "31d822281c9556614ce202ad00e8fbbc",
"assets/web/assets/ffp.png": "bd4f1404b199273d85ba026c13d61eb9",
"assets/web/assets/FlutterStack.png": "6eca91b2994ba62df2fbf2e48ea1cd87",
"assets/web/assets/footasylum.png": "d01931f1c483de3a3ed55d0bb75c05b0",
"assets/web/assets/github.svg": "26f54b16aa06a3856c7dd85ee9296f81",
"assets/web/assets/homecook.png": "ce62018da39b18518526a20ec58438fd",
"assets/web/assets/homevyte.png": "ebe058b64d6c26834d7104f6dd858627",
"assets/web/assets/jenny.png": "29f14677a7c4d79e83106cb249232913",
"assets/web/assets/linkedln.svg": "7b6a698ce68cc755f0be59bfe95a0688",
"assets/web/assets/logo.png": "af0b3f01c8a982f5bc5fb42bf4fb69a8",
"assets/web/assets/mine.jpg": "383a395ba55e10559695d3363560dc34",
"assets/web/assets/mini.png": "e7402dc68e1fe4ba771bff979bd7c746",
"assets/web/assets/outspark.png": "c59592fa82f9773f0fd004f880cf2b22",
"assets/web/assets/play_store.png": "cb53f21750e681cb090e73d28d35e974",
"assets/web/assets/prank.png": "64f1bc49f74b2f24a744839bcc15e805",
"assets/web/assets/rapid.png": "3333c0cdd642cc0f5e0e9ab26caa7405",
"assets/web/assets/Spendify.png": "27f4d56e23f018169553f456aeecc020",
"assets/web/assets/streamcamp.png": "facc707fad25e1ffbbdb37b45191b5f2",
"assets/web/assets/times.png": "f752f9f31eb55265cd79889b89aee2fa",
"assets/web/assets/touchpass.png": "9a10d6da7b0778bc72fe2a24a8866538",
"assets/web/assets/umo.png": "49109bbf2e877d571a66f8f1f5cb063b",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "2b9dec951631314a859ccddeec075b09",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "37fdaafb6bdad11933c1696a001ba209",
"icons/Icon-192.png": "ffe32092f1cdf2518473c21cd6de7dc6",
"icons/Icon-512.png": "7344d3b98cd15f0e896b903ea1af4c58",
"icons/Icon-maskable-192.png": "ffe32092f1cdf2518473c21cd6de7dc6",
"icons/Icon-maskable-512.png": "7344d3b98cd15f0e896b903ea1af4c58",
"index.html": "a1c419994b7401af846afa98f96131c4",
"/": "a1c419994b7401af846afa98f96131c4",
"main.dart.js": "009d9943e056961b2df3592c42851ebc",
"manifest.json": "7b32515d61fc7ba5a1801d2f1b6f0dc6",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
