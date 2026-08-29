import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/fade_in_animations.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/controllers/nav_controller.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/widgets/project_views.dart';
import 'package:portfolio/views/widgets/site_chrome.dart';
import 'package:portfolio/views/widgets/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.nav});

  final NavController nav;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: nav.homeScroll,
      slivers: [
        SliverToBoxAdapter(child: HeroSection()),
        const SliverToBoxAdapter(child: StatsSection()),
        const SliverToBoxAdapter(child: WhatIDoAndFeatured()),
        SliverToBoxAdapter(child: CareerSection(sectionKey: nav.experienceKey)),
        SliverToBoxAdapter(child: AboutSection(sectionKey: nav.aboutKey)),
        const SliverToBoxAdapter(child: ContactStrip()),
        const SliverToBoxAdapter(child: SiteFooter()),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Layout.isMobile(context);
    final showImage = Layout.isLandscape(context) && !Layout.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: mobile ? 24 : 40,
        bottom: mobile ? 28 : 48,
      ),
      child: ContentWidth(
        child: showImage
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 10, child: _HeroCopy(compact: false)),
                  SizedBox(width: 32),
                  Expanded(flex: 11, child: _HeroPortrait()),
                ],
              )
            : const _HeroCopy(compact: true),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final nav = navController();
    final landscape = Layout.isLandscape(context);
    final titleSize = compact
        ? (landscape ? 28.0 : 32.0)
        : landscape
            ? 40.0
            : 52.0;
    return FadeInAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Building Scalable Mobile Products From Technical Vision To Delivery',
            // 'Building Scalable Mobile Products. Leading Teams from Vision to Delivery.',
            // 'I BUILD MOBILE PRODUCTS. I LEAD TEAMS. I DELIVER RESULTS.',
            style: salutationTextStyle(compact ? 12 : 14),
          ),
          const SizedBox(height: 16),
          // Senior Flutter & Android Engineer · Mobile Tech Lead · Technical Project Manager
          Text(
            'Senior Flutter & Android Engineer',
            style: headingText(titleSize),
          ),
          const SizedBox(height: 6),
          Text(
            'Mobile Tech Lead',
            style: headingText(compact ? 22 : 36).copyWith(
              color: Colors.white.withOpacity(0.92),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Technical Project Manager.',
            style: headingText(compact ? 20 : 28).copyWith(
              color: Colors.white.withOpacity(0.78),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              '10+ years of mobile development experience and 5+ years in technical leadership — shipping production apps, leading teams, and tightening delivery from 4-week to 2-week cycles.',
              style: normalText(compact ? 14 : 16, textColor: textSecondary),
            ),
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              SkillChip(label: 'Android', icon: Icons.android_rounded, filled: true),
              SkillChip(label: 'Flutter', icon: Icons.flutter_dash, filled: true),
              SkillChip(label: 'Kotlin', icon: Icons.code_rounded, filled: true),
              SkillChip(label: 'Leadership', icon: Icons.groups_rounded, filled: true),
            ],
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PrimaryButton(
                label: 'Explore My Work',
                onTap: nav.goWork,
              ),
              OutlineButton(
                label: 'Download Resume',
                icon: Icons.download_rounded,
                onTap: launchCv,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  const _HeroPortrait();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'mine.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (_, __, ___) => Container(
                color: bgElevated,
                alignment: Alignment.center,
                child: const Icon(Icons.person, color: accentColor, size: 72),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.55),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 12,
              bottom: 12,
              child: const _AvailabilityCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvailabilityCard extends StatelessWidget {
  const _AvailabilityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xE612161C),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              style: normalText(13),
              children: [
                const TextSpan(text: 'Available for '),
                TextSpan(
                  text: 'CURRENTLY OPEN',
                  style: normalText(13, textColor: accentColor)
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available to Join',
                style: normalText(12, textColor: textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  static const items = [
    (Icons.calendar_month_outlined, '10+', 'Years Experience'),
    (Icons.groups_outlined, '5+', 'Years Leadership'),
    (Icons.rocket_launch_outlined, '3', 'Major Products Led'),
    (Icons.trending_up_rounded, '4 → 2 Weeks', 'Delivery Cycle Improvement'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgElevated,
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: ContentWidth(
        child: WrapGrid(
          columnCount: Layout.isMobile(context) ? 2 : 4,
          children: [
            for (final item in items) _StatTile(item: item),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.item});

  final (IconData, String, String) item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(item.$1, color: accentColor, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.$2, style: titleText(15), maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(
                item.$3,
                style: normalText(12, textColor: textSecondary),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WhatIDoAndFeatured extends StatelessWidget {
  const WhatIDoAndFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    final sideBySide = Layout.isDesktop(context) ||
        (Layout.isLandscape(context) && Layout.sizeOf(context).width >= 900);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sideBySide ? 48 : 32),
      child: ContentWidth(
        child: sideBySide
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: _WhatIDoBlock()),
                  SizedBox(width: 28),
                  Expanded(flex: 7, child: _FeaturedBlock()),
                ],
              )
            : const Column(
                children: [
                  _WhatIDoBlock(),
                  SizedBox(height: 32),
                  _FeaturedBlock(),
                ],
              ),
      ),
    );
  }
}

class _WhatIDoBlock extends StatelessWidget {
  const _WhatIDoBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('What I Do'),
        const SizedBox(height: 18),
        WrapGrid(
          columnCount: Layout.isMobile(context) ? 1 : 2,
          children: [
            for (final item in PortfolioData.whatIDo)
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(item.icon, color: accentColor, size: 22),
                    const SizedBox(height: 10),
                    Text(item.title, style: titleText(15)),
                    const SizedBox(height: 8),
                    Text(
                      item.points.join(' · '),
                      style: normalText(12, textColor: textSecondary),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        TextLinkButton(
          label: 'View My Tech Stack',
          onTap: navController().goTech,
        ),
      ],
    );
  }
}

class _FeaturedBlock extends StatelessWidget {
  const _FeaturedBlock();

  @override
  Widget build(BuildContext context) {
    final featured = PortfolioData.featured;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(child: SectionLabel('Featured Projects')),
            const SizedBox(width: 16),
            TextLinkButton(
              label: 'View All Projects',
              onTap: navController().goWork,
            ),
          ],
        ),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, constraints) {
            return WrapGrid(
              columnCount: Layout.featuredColumns(constraints.maxWidth),
              children: [
                for (final project in featured)
                  FeaturedProjectCard(project: project, dense: true),
              ],
            );
          },
        ),
      ],
    );
  }
}

class CareerSection extends StatelessWidget {
  const CareerSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final mobile = Layout.isMobile(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: bgElevated,
      padding: EdgeInsets.symmetric(vertical: mobile ? 36 : 56),
      child: ContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionLabel('Career Journey'),
            const SizedBox(height: 28),
            if (Layout.isMobile(context) || Layout.sizeOf(context).width < 1000)
              const _VerticalTimeline()
            else
              const _HorizontalTimeline(),
          ],
        ),
      ),
    );
  }
}

class _HorizontalTimeline extends StatelessWidget {
  const _HorizontalTimeline();

  @override
  Widget build(BuildContext context) {
    final stops = PortfolioData.career;
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < stops.length; i++) ...[
              _Dot(active: stops[i].current),
              if (i < stops.length - 1)
                Expanded(
                  child: Container(height: 2, color: cardBorder),
                ),
            ],
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final stop in stops)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _CareerCard(stop: stop),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _VerticalTimeline extends StatelessWidget {
  const _VerticalTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final stop in PortfolioData.career)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    _Dot(active: stop.current),
                    Container(width: 2, height: 88, color: cardBorder),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(child: _CareerCard(stop: stop)),
              ],
            ),
          ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: active ? accentColor : bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: accentColor, width: 2),
      ),
    );
  }
}

class _CareerCard extends StatelessWidget {
  const _CareerCard({required this.stop});

  final CareerStop stop;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: stop.current ? accentColor.withOpacity(0.7) : cardBorder,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(stop.years, style: normalText(12, textColor: accentColor)),
          const SizedBox(height: 6),
          Text(stop.role, style: titleText(15), maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(stop.company, style: normalText(12, textColor: textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Text(
            stop.summary,
            style: normalText(12, textColor: textSecondary),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  Widget build(BuildContext context) {
    final compact = Layout.isMobile(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: compact ? 36 : 56),
      child: ContentWidth(
        child: AppCard(
          padding: EdgeInsets.all(compact ? 20 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionLabel('About'),
              const SizedBox(height: 12),
              Text('The engineer and the lead.', style: titleText(compact ? 22 : 28)),
              const SizedBox(height: 12),
              Text(
                'I’m Vishal Kaushal — a Senior Flutter & Android Engineer, Mobile Tech Lead, and Technical Project Manager. I have 10+ years of hands-on mobile development and 5+ years leading engineers, delivery, and product outcomes.',
                style: normalText(compact ? 14 : 16, textColor: textSecondary),
              ),
              const SizedBox(height: 12),
              Text(
                'I build production apps, set architecture, mentor teams, and tighten delivery. Recent work includes taking release cycles from 4 weeks to 2 while keeping quality high across Flutter, native Android, and Play Store operations.',
                style: normalText(compact ? 14 : 16, textColor: textSecondary),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  SkillChip(label: 'Immediate Joiner', filled: true),
                  SkillChip(label: 'Open to opportunities', filled: true),
                  SkillChip(label: 'Flutter'),
                  SkillChip(label: 'Android'),
                  SkillChip(label: 'Leadership'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactStrip extends StatelessWidget {
  const ContactStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Layout.isMobile(context);
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('Contact'),
        const SizedBox(height: 10),
        Text('Let’s build the next product.', style: titleText(24)),
        const SizedBox(height: 8),
        Text(
          'Open to opportunities, leadership roles, and high-impact mobile work. Email or call — I typically respond the same day.',
          style: normalText(14, textColor: textSecondary),
        ),
      ],
    );
    final actions = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        OutlineButton(
          label: 'Email Me',
          icon: Icons.mail_outline_rounded,
          accent: true,
          expanded: mobile,
          onTap: launchEmail,
        ),
        OutlineButton(
          label: 'Call Me',
          icon: Icons.phone_outlined,
          expanded: mobile,
          onTap: launchPhone,
        ),
      ],
    );

    return Padding(
      key: navController().contactKey,
      padding: EdgeInsets.symmetric(vertical: mobile ? 32 : 48),
      child: ContentWidth(
        child: AppCard(
          child: mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    copy,
                    const SizedBox(height: 20),
                    actions,
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: copy),
                    const SizedBox(width: 24),
                    actions,
                  ],
                ),
        ),
      ),
    );
  }
}

