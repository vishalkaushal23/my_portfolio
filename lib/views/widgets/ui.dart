import 'package:flutter/material.dart';
import 'package:portfolio/res/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.borderColor,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor ?? cardBorder),
      ),
      child: child,
    );

    if (onTap == null) return content;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: onTap, child: content),
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: labelText(12));
  }
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.expanded = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool expanded;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final child = AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
        color: hovered ? accentMuted : accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.label,
            style: GoogleInter.button(Colors.black),
          ),
          const SizedBox(width: 8),
          Icon(widget.icon ?? Icons.arrow_forward_rounded,
              size: 18, color: Colors.black),
        ],
      ),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.expanded ? SizedBox(width: double.infinity, child: child) : child,
      ),
    );
  }
}

class OutlineButton extends StatefulWidget {
  const OutlineButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.expanded = false,
    this.accent = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool expanded;
  final bool accent;

  @override
  State<OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final border = widget.accent ? accentColor : Colors.white24;
    final child = AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: hovered ? Colors.white.withOpacity(0.06) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: hovered ? accentColor : border),
      ),
      child: Row(
        mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 18, color: textPrimary),
            const SizedBox(width: 8),
          ],
          Text(widget.label, style: GoogleInter.button(textPrimary)),
        ],
      ),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.expanded ? SizedBox(width: double.infinity, child: child) : child,
      ),
    );
  }
}

class TextLinkButton extends StatefulWidget {
  const TextLinkButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<TextLinkButton> createState() => _TextLinkButtonState();
}

class _TextLinkButtonState extends State<TextLinkButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          labelWithArrow(widget.label),
          style: normalText(14, textColor: accentColor).copyWith(
            fontWeight: FontWeight.w600,
            decoration: hovered ? TextDecoration.underline : TextDecoration.none,
            decorationColor: accentColor,
          ),
        ),
      ),
    );
  }
}

String labelWithArrow(String label) {
  if (label.contains('→') || label.contains('->')) return label.replaceAll('->', '→');
  return '$label →';
}

class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.label,
    this.icon,
    this.filled = false,
  });

  final String label;
  final IconData? icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: filled ? accentColor.withOpacity(0.16) : Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: filled ? accentColor.withOpacity(0.5) : cardBorder,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: filled ? accentColor : textSecondary),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: normalText(12, textColor: filled ? accentColor : textSecondary)
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class FilterChipButton extends StatelessWidget {
  const FilterChipButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: selected ? accentColor : cardBorder),
        ),
        child: Text(
          label,
          style: normalText(
            13,
            textColor: selected ? Colors.black : textSecondary,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: Layout.pagePadding(context)),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}

class WrapGrid extends StatelessWidget {
  const WrapGrid({
    super.key,
    required this.columnCount,
    required this.children,
    this.spacing = 14,
    this.runSpacing = 14,
  });

  final int columnCount;
  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = columnCount.clamp(1, 8);
        final width = (constraints.maxWidth - spacing * (count - 1)) / count;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: [
            for (final child in children)
              SizedBox(width: width, child: child),
          ],
        );
      },
    );
  }
}

class GoogleInter {
  static TextStyle button(Color color) => normalText(14, textColor: color).copyWith(
        fontWeight: FontWeight.w700,
      );
}

Future<void> launchCv() => launchUrlString(kCvUrl);

Future<void> launchEmail() =>
    launchUrlString('mailto:$kEmail');

Future<void> launchPhone() =>
    launchUrlString('tel:$kPhone');

Future<void> launchLinkedIn() => launchUrlString(kLinkedIn);

Future<void> launchIfPresent(String? url) async {
  if (url == null || url.isEmpty) return;
  await launchUrlString(url);
}
