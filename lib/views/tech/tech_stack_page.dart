import 'package:flutter/material.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/widgets/site_chrome.dart';
import 'package:portfolio/views/widgets/ui.dart';

class TechStackPage extends StatelessWidget {
  const TechStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Layout.isMobile(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mobile ? 28 : 44),
            child: ContentWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('My Tech Stack', style: headingText(mobile ? 32 : 44)),
                            const SizedBox(height: 10),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 560),
                              child: Text(
                                'Technologies, tools and practices I use to build high-quality, scalable and performant mobile applications.',
                                style: normalText(15, textColor: textSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!mobile) const _ExperienceBadge(),
                    ],
                  ),
                  if (mobile) ...[
                    const SizedBox(height: 16),
                    const _ExperienceBadge(),
                  ],
                  const SizedBox(height: 32),
                  if (mobile)
                    const _TechAccordion()
                  else
                    const _TechGrid(),
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SiteFooter()),
      ],
    );
  }
}

class _ExperienceBadge extends StatelessWidget {
  const _ExperienceBadge();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_month_outlined, color: accentColor, size: 18),
          const SizedBox(width: 8),
          Text('10+ Years of Experience', style: titleText(13)),
        ],
      ),
    );
  }
}

class _TechGrid extends StatelessWidget {
  const _TechGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 1100
            ? 4
            : constraints.maxWidth >= 700
                ? 2
                : 1;
        return WrapGrid(
          columnCount: columns,
          children: [
            for (final category in PortfolioData.techStack)
              _TechCard(category: category),
          ],
        );
      },
    );
  }
}

class _TechCard extends StatelessWidget {
  const _TechCard({required this.category});

  final TechCategory category;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(category.icon, color: accentColor, size: 22),
          const SizedBox(height: 10),
          Text(category.title, style: titleText(15)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.items
                .map(
                  (item) => SkillChip(
                    label: item.label,
                    icon: item.icon,
                    filled: category.items.length <= 2,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TechAccordion extends StatelessWidget {
  const _TechAccordion();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final category in PortfolioData.techStack)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(color: cardBorder),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: accentColor.withOpacity(0.45)),
                ),
                backgroundColor: cardColor,
                collapsedBackgroundColor: cardColor,
                iconColor: accentColor,
                collapsedIconColor: textSecondary,
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                leading: Icon(category.icon, color: accentColor, size: 20),
                title: Text(category.title, style: titleText(15)),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: category.items
                          .map((item) => SkillChip(label: item.label, icon: item.icon))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
