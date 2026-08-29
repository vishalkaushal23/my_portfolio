import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bgColor = Color(0xFF0A0C10);
const Color bgElevated = Color(0xFF10151C);
const Color cardColor = Color(0xFF131920);
const Color cardBorder = Color(0xFF252D38);
const Color accentColor = Color(0xFF2DD4BF);
const Color accentMuted = Color(0xFF14B8A6);
const Color textPrimary = Color(0xFFF8FAFC);
const Color textSecondary = Color(0xFF9AA3B2);
const Color textMuted = Color(0xFF6B7380);

/// Backward-compatible aliases used by older screens.
const Color primaryColor = bgColor;
const Color secondaryColor = cardColor;
const Color buttonColor = accentColor;
const Color textColor = textPrimary;
const Color textSecondaryColor = textSecondary;

const double kDefaultPadding = 20.0;
const double kDefaultMargin = 20.0;
const double kMaxContentWidth = 1440.0;
const double kNavHeight = 64.0;
const String kCvUrl =
    'https://drive.google.com/file/d/1o6ZlPIT5etlRTGKD8yVRc_4MfNmlVUmq/view?usp=sharing';
const String kEmail = 'vishalkaushal1423@gmail.com';
const String kPhone = '+91-7888745936';
const String kPhoneDisplay = 'Phone';
const String kLinkedIn =
    'https://www.linkedin.com/in/vishal-kaushal-29620096/';

TextStyle headingText(double size) => GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: textPrimary,
      height: 1.15,
      letterSpacing: -0.8,
    );

TextStyle titleText(double size) => GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      letterSpacing: -0.4,
    );

TextStyle salutationTextStyle(double size) => GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: accentColor,
      letterSpacing: 1.6,
    );

TextStyle normalText(double size, {Color textColor = textPrimary}) =>
    GoogleFonts.inter(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );

TextStyle labelText(double size) => GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: accentColor,
      letterSpacing: 1.8,
    );

class Layout {
  static Size sizeOf(BuildContext context) => MediaQuery.sizeOf(context);

  static bool isPortrait(BuildContext context) {
    final size = sizeOf(context);
    return size.height >= size.width;
  }

  static bool isLandscape(BuildContext context) => !isPortrait(context);

  static bool isMobile(BuildContext context) => sizeOf(context).width < 700;

  static bool isTablet(BuildContext context) {
    final width = sizeOf(context).width;
    return width >= 700 && width < 1100;
  }

  static bool isDesktop(BuildContext context) => sizeOf(context).width >= 1100;

  static bool useCompactNav(BuildContext context) =>
      sizeOf(context).width < 1100;

  static int featuredColumns(double width) {
    if (width >= 720) return 3;
    if (width >= 480) return 2;
    return 1;
  }

  static double pagePadding(BuildContext context) {
    final size = sizeOf(context);
    if (size.width > size.height) {
      if (size.width < 900) return 12;
      if (size.width < 1200) return 16;
      return 24;
    }
    if (size.width > 1400) return 40;
    if (size.width > 1100) return 28;
    if (size.width > 700) return 20;
    return 16;
  }
}
