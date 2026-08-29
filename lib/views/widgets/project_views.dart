import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/widgets/ui.dart';

class FeaturedProjectCard extends StatefulWidget {
  const FeaturedProjectCard({
    super.key,
    required this.project,
    this.large = false,
    this.dense = false,
  });

  final Project project;
  final bool large;
  final bool dense;

  @override
  State<FeaturedProjectCard> createState() => _FeaturedProjectCardState();
}

class _FeaturedProjectCardState extends State<FeaturedProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final dense = widget.dense;
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.identity()
          ..setTranslationRaw(0, hovered ? -4.0 : 0.0, 0),
        child: AppCard(
          padding: EdgeInsets.zero,
          onTap: () => launchIfPresent(project.primaryLink),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: AspectRatio(
                  aspectRatio: dense ? 16 / 9 : widget.large ? 16 / 10 : 16 / 8,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        project.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: bgElevated,
                          alignment: Alignment.center,
                          child: const Icon(Icons.apps, color: accentColor),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.45),
                            ],
                          ),
                        ),
                      ),
                      if (project.featured)
                        const Positioned(
                          left: 12,
                          top: 12,
                          child: _FeaturedBadge(),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(dense ? 12 : 16, 12, dense ? 12 : 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: titleText(dense ? 14 : 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (project.category.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        project.category,
                        style: normalText(12, textColor: accentColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: normalText(dense ? 12 : 13, textColor: textSecondary),
                      maxLines: dense ? 2 : widget.large ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.technologies
                          .take(dense ? 2 : 3)
                          .map((tech) => SkillChip(label: tech))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'View Case Study →',
                      style: normalText(12, textColor: accentColor)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedBadge extends StatelessWidget {
  const _FeaturedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'FEATURED',
        style: normalText(10, textColor: Colors.black).copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class CompactProjectTile extends StatelessWidget {
  const CompactProjectTile({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchIfPresent(project.primaryLink),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                project.imageUrl,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: titleText(13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    project.technologies.take(2).join(' · '),
                    style: normalText(11, textColor: textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
