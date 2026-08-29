import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/res/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.onFinished});

  final VoidCallback? onFinished;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _spin;
  late final AnimationController _pulse;
  late final AnimationController _intro;

  @override
  void initState() {
    super.initState();
    _spin = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _intro = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..forward();

    _intro.addStatusListener((status) {
      if (status != AnimationStatus.completed || !mounted) return;
      Future<void>.delayed(const Duration(milliseconds: 180), () {
        if (!mounted) return;
        if (widget.onFinished != null) {
          widget.onFinished!();
        } else {
          Get.offAllNamed('/');
        }
      });
    });
  }

  @override
  void dispose() {
    _spin.dispose();
    _pulse.dispose();
    _intro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    final portrait = media.height >= media.width;
    final compact = media.width < 700;
    final orbit = portrait && compact
        ? (media.width * 0.58).clamp(220.0, 300.0)
        : compact
            ? (media.shortestSide * 0.36).clamp(180.0, 240.0)
            : (media.shortestSide * 0.26).clamp(220.0, 300.0);
    final mark = orbit * 0.58;
    final nameSize = compact && portrait ? 18.0 : compact ? 15.0 : 16.0;

    final logoIn = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack),
    );
    final copyIn = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.35, 0.7, curve: Curves.easeOut),
    );
    final barIn = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.2, 1.0, curve: Curves.easeInOutCubic),
    );

    return Scaffold(
      backgroundColor: bgColor,
      body: AnimatedBuilder(
        animation: Listenable.merge([_spin, _pulse, _intro]),
        builder: (context, _) {
          final glow = 0.18 + (_pulse.value * 0.22);
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: orbit,
                  height: orbit,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: orbit * 0.88 + (_pulse.value * 18),
                        height: orbit * 0.88 + (_pulse.value * 18),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(glow),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      CustomPaint(
                        size: Size(orbit, orbit),
                        painter: _OrbitPainter(
                          rotation: _spin.value * math.pi * 2,
                          accent: accentColor,
                        ),
                      ),
                      FadeTransition(
                        opacity: logoIn,
                        child: ScaleTransition(
                          scale: Tween<double>(begin: 0.72, end: 1).animate(logoIn),
                          child: Container(
                            width: mark,
                            height: mark,
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(mark * 0.22),
                              border: Border.all(color: cardBorder),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'vk_logo.png',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Center(
                                child: Text(
                                  'VK',
                                  style: titleText(mark * 0.24)
                                      .copyWith(color: accentColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: compact ? 32 : 28),
                FadeTransition(
                  opacity: copyIn,
                  child: Column(
                    children: [
                      Text(
                        'VISHAL KAUSHAL',
                        style: titleText(nameSize).copyWith(letterSpacing: 3.2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Flutter  ·  Android  ·  Leadership',
                        style: normalText(
                          compact && portrait ? 14 : 12,
                          textColor: textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: compact ? 32 : 28),
                SizedBox(
                  width: orbit,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(
                      minHeight: compact ? 4 : 3,
                      value: barIn.value,
                      backgroundColor: cardBorder,
                      color: accentColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  _OrbitPainter({required this.rotation, required this.accent});

  final double rotation;
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 6;

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..color = accent.withOpacity(0.16);
    canvas.drawCircle(center, radius, track);

    final sweep = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: math.pi * 2,
        colors: [
          Colors.transparent,
          accent.withOpacity(0.15),
          accent,
          Colors.transparent,
        ],
        stops: const [0.0, 0.45, 0.72, 1.0],
        transform: GradientRotation(rotation),
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, sweep);

    final inner = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = accent.withOpacity(0.08);
    canvas.drawCircle(center, radius - 10, inner);
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter oldDelegate) =>
      oldDelegate.rotation != rotation;
}
