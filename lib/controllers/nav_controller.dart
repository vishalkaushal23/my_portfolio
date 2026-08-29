import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppPage { home, work, tech }

NavController navController() {
  if (Get.isRegistered<NavController>()) {
    return Get.find<NavController>();
  }
  return Get.put(NavController(), permanent: true);
}

class NavController extends GetxController {
  bool showSplash = true;
  final homeScroll = ScrollController();
  final experienceKey = GlobalKey();
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();

  Future<void> goHome({String? section}) async {
    if (Get.currentRoute != '/') {
      Get.offAllNamed('/', arguments: section);
      return;
    }
    if (section != null) {
      await scrollTo(section);
    } else if (homeScroll.hasClients) {
      homeScroll.animateTo(
        0,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void goWork() {
    if (Get.currentRoute != '/work') {
      Get.offAllNamed('/work');
    }
  }

  void goTech() {
    if (Get.currentRoute != '/tech-stack') {
      Get.offAllNamed('/tech-stack');
    }
  }

  Future<void> scrollTo(String section) async {
    await Future<void>.delayed(const Duration(milliseconds: 80));
    final key = switch (section) {
      'experience' => experienceKey,
      'about' => aboutKey,
      'contact' => contactKey,
      _ => null,
    };
    final target = key?.currentContext;
    if (target == null || !target.mounted) return;
    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }
}
