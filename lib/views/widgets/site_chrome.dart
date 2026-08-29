import 'package:flutter/material.dart';
import 'package:portfolio/controllers/nav_controller.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/widgets/ui.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({super.key, required this.current, this.onMenu});

  final AppPage current;
  final VoidCallback? onMenu;

  @override
  Widget build(BuildContext context) {
    final nav = navController();
    final compact = Layout.useCompactNav(context);

    return Container(
      height: kNavHeight,
      decoration: const BoxDecoration(
        color: bgColor,
        border: Border(bottom: BorderSide(color: cardBorder)),
      ),
      child: ContentWidth(
        child: Row(
          children: [
            BrandMark(compact: compact),
            const Spacer(),
            if (!compact) ...[
              _NavLink(
                label: 'Home',
                active: current == AppPage.home,
                onTap: () => nav.goHome(),
              ),
              _NavLink(
                label: 'Projects',
                active: current == AppPage.work,
                onTap: nav.goWork,
              ),
              _NavLink(
                label: 'Experience',
                onTap: () => nav.goHome(section: 'experience'),
              ),
              _NavLink(
                label: 'Skills',
                active: current == AppPage.tech,
                onTap: nav.goTech,
              ),
              _NavLink(
                label: 'About',
                onTap: () => nav.goHome(section: 'about'),
              ),
              _NavLink(
                label: 'Contact',
                onTap: () => nav.goHome(section: 'contact'),
              ),
              const SizedBox(width: 16),
              OutlineButton(
                label: 'Download CV',
                icon: Icons.download_rounded,
                accent: true,
                onTap: launchCv,
              ),
            ] else
              IconButton(
                onPressed: onMenu,
                icon: const Icon(Icons.menu_rounded, color: textPrimary),
              ),
          ],
        ),
      ),
    );
  }
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => navController().goHome(),
        child: Row(
          children: [
            Container(
              width: compact ? 40 : 44,
              height: compact ? 40 : 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: cardBorder),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'vk_logo.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(
                  child: Text(
                    'VK',
                    style: titleText(13).copyWith(color: accentColor),
                  ),
                ),
              ),
            ),
            if (!compact) ...[
              const SizedBox(width: 10),
              Text(
                'VISHAL KAUSHAL',
                style: titleText(13).copyWith(letterSpacing: 1.4),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.onTap,
    this.active = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool active;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.active || hovered ? textPrimary : textSecondary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => hovered = true),
        onExit: (_) => setState(() => hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: normalText(13, textColor: color).copyWith(
                  fontWeight: widget.active ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: 2,
                width: widget.active ? 22 : 0,
                color: accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final nav = navController();
    return Drawer(
      backgroundColor: bgElevated,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 12, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BrandMark(),
                  const Spacer(),
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close, color: textPrimary),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _drawerItem('Home', () {
                onClose();
                nav.goHome();
              }),
              _drawerItem('Projects', () {
                onClose();
                nav.goWork();
              }),
              _drawerItem('Experience', () {
                onClose();
                nav.goHome(section: 'experience');
              }),
              _drawerItem('Skills', () {
                onClose();
                nav.goTech();
              }),
              _drawerItem('About', () {
                onClose();
                nav.goHome(section: 'about');
              }),
              _drawerItem('Contact', () {
                onClose();
                nav.goHome(section: 'contact');
              }),
              const Spacer(),
              OutlineButton(
                label: 'Download CV',
                icon: Icons.download_rounded,
                accent: true,
                expanded: true,
                onTap: launchCv,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(String label, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: titleText(18)),
      onTap: onTap,
    );
  }
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: cardBorder)),
      ),
      child: ContentWidth(
        padding: EdgeInsets.fromLTRB(
          Layout.pagePadding(context),
          28,
          Layout.pagePadding(context),
          28,
        ),
        child: Layout.isMobile(context)
            ? Column(
                children: [
                  Text(
                    '© 2026 Vishal Kaushal. All rights reserved.',
                    style: normalText(13, textColor: textMuted),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    children: [
                      TextLinkButton(label: 'Email', onTap: launchEmail),
                      TextLinkButton(label: 'Phone', onTap: launchPhone),
                      TextLinkButton(label: 'LinkedIn', onTap: launchLinkedIn),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Text(
                    '© 2026 Vishal Kaushal. All rights reserved.',
                    style: normalText(13, textColor: textMuted),
                  ),
                  const Spacer(),
                  TextLinkButton(label: 'Email', onTap: launchEmail),
                  const SizedBox(width: 20),
                  TextLinkButton(label: 'Phone', onTap: launchPhone),
                  const SizedBox(width: 20),
                  TextLinkButton(label: 'LinkedIn', onTap: launchLinkedIn),
                ],
              ),
      ),
    );
  }
}
