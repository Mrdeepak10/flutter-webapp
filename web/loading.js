//  <script>
//    window.addEventListener('load', function(ev) {
//      // Download main.dart.js
//      _flutter.loader.loadEntrypoint({
//        serviceWorker: {
//          serviceWorkerVersion: serviceWorkerVersion,
//        },
//        onEntrypointLoaded: function(engineInitializer) {
//          engineInitializer.initializeEngine().then(function(appRunner) {
//           loading.remove();
//            appRunner.runApp();
//          });
//        }
//      });
//    });
//  </script>


window.addEventListener('load', function () {
  var loading = document.getElementById('loader-wrapper');

  _flutter.loader.loadEntrypoint({
    serviceWorker: {
      serviceWorkerVersion: serviceWorkerVersion,
    },
    onEntrypointLoaded: async function (engineInitializer) {
      let appRunner = await engineInitializer.initializeEngine();

      loading.remove();

      await appRunner.runApp();
    }
  });
});

//
//<!--  <script>-->
//<!--    window.addEventListener('load', function(ev) {-->
//<!--      // Download main.dart.js-->
//<!--      _flutter.loader.loadEntrypoint({-->
//<!--        serviceWorker: {-->
//<!--          serviceWorkerVersion: serviceWorkerVersion,-->
//<!--        },-->
//<!--        onEntrypointLoaded: function(engineInitializer) {-->
//<!--          engineInitializer.initializeEngine().then(function(appRunner) {-->
//<!--            appRunner.runApp();-->
//<!--          });-->
//<!--        }-->
//<!--      });-->
//<!--    });-->
//<!--  </script>-->