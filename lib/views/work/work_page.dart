import 'package:flutter/material.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/widgets/project_views.dart';
import 'package:portfolio/views/widgets/site_chrome.dart';
import 'package:portfolio/views/widgets/ui.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  ProjectFilter filter = ProjectFilter.all;
  int carouselIndex = 0;

  List<Project> get filtered =>
      PortfolioData.projects.where((project) => project.matches(filter)).toList();

  @override
  Widget build(BuildContext context) {
    final mobile = Layout.isMobile(context);
    final projects = filtered;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mobile ? 28 : 44),
            child: ContentWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore My Work', style: headingText(mobile ? 32 : 44)),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: Text(
                      'From hands-on Flutter and Android engineering to technical leadership — products shipped, teams led, and delivery improved.',
                      style: normalText(15, textColor: textSecondary),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final entry in _filters)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChipButton(
                              label: entry.$2,
                              selected: filter == entry.$1,
                              onTap: () => setState(() {
                                filter = entry.$1;
                                carouselIndex = 0;
                              }),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  if (projects.isEmpty)
                    Text('No projects in this filter yet.',
                        style: normalText(14, textColor: textSecondary))
                  else if (mobile)
                    _MobileCarousel(
                      projects: projects,
                      index: carouselIndex,
                      onChanged: (value) => setState(() => carouselIndex = value),
                    )
                  else
                    _DesktopWorkGrid(projects: projects),
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

const _filters = [
  (ProjectFilter.all, 'All'),
  (ProjectFilter.featured, 'Featured'),
  (ProjectFilter.flutter, 'Flutter'),
  (ProjectFilter.android, 'Android'),
  (ProjectFilter.ai, 'AI / ML'),
  (ProjectFilter.payments, 'Payments'),
];

class _DesktopWorkGrid extends StatelessWidget {
  const _DesktopWorkGrid({required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final leading = projects.take(3).toList();
    final more = projects.skip(3).toList();
    final desktop = Layout.isDesktop(context);
    final columns = desktop ? 3 : 2;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              WrapGrid(
                columnCount: columns,
                children: [
                  for (final project in leading)
                    FeaturedProjectCard(project: project, large: true, dense: true),
                ],
              ),
              if (more.isNotEmpty && !desktop) ...[
                const SizedBox(height: 16),
                _MoreProjectsCard(projects: more),
              ],
            ],
          ),
        ),
        if (more.isNotEmpty && desktop) ...[
          const SizedBox(width: 16),
          SizedBox(
            width: 280,
            child: _MoreProjectsCard(projects: more),
          ),
        ],
      ],
    );
  }
}

class _MoreProjectsCard extends StatefulWidget {
  const _MoreProjectsCard({required this.projects});

  final List<Project> projects;

  @override
  State<_MoreProjectsCard> createState() => _MoreProjectsCardState();
}

class _MoreProjectsCardState extends State<_MoreProjectsCard> {
  bool expanded = false;
  static const _collapsedCount = 8;

  @override
  Widget build(BuildContext context) {
    final remaining = widget.projects.length - _collapsedCount;
    final visible = expanded || remaining <= 0
        ? widget.projects
        : widget.projects.take(_collapsedCount).toList();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More Projects', style: titleText(16)),
          const SizedBox(height: 12),
          ...visible.map(
            (project) => CompactProjectTile(project: project),
          ),
          if (remaining > 0)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextLinkButton(
                label: expanded ? 'Show less' : '+$remaining more',
                onTap: () => setState(() => expanded = !expanded),
              ),
            ),
        ],
      ),
    );
  }
}

class _MobileCarousel extends StatelessWidget {
  const _MobileCarousel({
    required this.projects,
    required this.index,
    required this.onChanged,
  });

  final List<Project> projects;
  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 520,
          child: PageView.builder(
            controller: PageController(initialPage: index),
            onPageChanged: onChanged,
            itemCount: projects.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FeaturedProjectCard(project: projects[i], large: true),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < projects.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: i == index ? 18 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: i == index ? accentColor : cardBorder,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
