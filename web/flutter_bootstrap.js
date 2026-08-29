{{flutter_js}}
{{flutter_build_config}}

const flutterConfig = {
  assetBase: window.__FLUTTER_ASSET_BASE || '/',
  entrypointBaseUrl: window.__FLUTTER_ASSET_BASE || '/',
  // GitHub Pages does not send COOP/COEP, so multi-threaded Skwasm hangs.
  forceSingleThreadedSkwasm: true,
};

_flutter.loader.load({
  config: flutterConfig,
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine(flutterConfig);
    await appRunner.runApp();
    document.querySelectorAll('.boot').forEach(function (el) {
      el.remove();
    });
  },
});
