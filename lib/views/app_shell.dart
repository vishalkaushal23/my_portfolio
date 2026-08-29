import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/nav_controller.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/home/home_page.dart';
import 'package:portfolio/views/splash/splash.dart';
import 'package:portfolio/views/tech/tech_stack_page.dart';
import 'package:portfolio/views/widgets/site_chrome.dart';
import 'package:portfolio/views/work/work_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.page});

  final AppPage page;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = Get.arguments;
      if (args is String) {
        navController().scrollTo(args);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final nav = navController();
    if (nav.showSplash && widget.page == AppPage.home) {
      return SplashScreen(
        onFinished: () => setState(() => nav.showSplash = false),
      );
    }
    final compact = Layout.useCompactNav(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: bgColor,
      endDrawer: compact
          ? MobileNavDrawer(onClose: () => Navigator.pop(context))
          : null,
      body: Column(
        children: [
          SiteHeader(
            current: widget.page,
            onMenu:
                compact ? () => scaffoldKey.currentState?.openEndDrawer() : null,
          ),
          Expanded(
            child: switch (widget.page) {
              AppPage.home => HomePage(nav: nav),
              AppPage.work => const WorkPage(),
              AppPage.tech => const TechStackPage(),
            },
          ),
        ],
      ),
    );
  }
}
