import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/splash/components/animated_loading_text.dart';

import '../../res/constants.dart';
import 'components/animated_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.onFinished});

  final VoidCallback? onFinished;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      if (widget.onFinished != null) {
        widget.onFinished!();
      } else {
        Get.offAllNamed('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedLoadingText()
          ],
        ),
      ),
    );
  }
}
