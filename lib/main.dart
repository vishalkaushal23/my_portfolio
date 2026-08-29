import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/nav_controller.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/app_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (details) {
    return Material(
      color: bgColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            details.exceptionAsString(),
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vishal Kaushal | Flutter | Android Developer',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        colorScheme: const ColorScheme.dark(
          primary: accentColor,
          surface: bgColor,
        ),
        useMaterial3: true,
      ),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 220),
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const AppShell(page: AppPage.home),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const AppShell(page: AppPage.home)),
        GetPage(name: '/work', page: () => const AppShell(page: AppPage.work)),
        GetPage(
          name: '/tech-stack',
          page: () => const AppShell(page: AppPage.tech),
        ),
      ],
      initialBinding: BindingsBuilder(() {
        if (!Get.isRegistered<NavController>()) {
          Get.put(NavController(), permanent: true);
        }
      }),
    );
  }
}
