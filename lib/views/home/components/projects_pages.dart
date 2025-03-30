import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/responsive.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum ProjectFilter {
  all,
  flutter,
  android,
}

enum ProjectType {
  flutter,
  android,
  design,
}

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String selectedFilter = 'all'; // Default selected filter

  final List<Project> allProjects = [
    Project(
      title: "TimesJobs: Alerts & Job Search",
      description:
          "Find Your Dream Job with TimesJobs - The Ultimate Job Search App",
      imageUrl: "times.png",
      liveLink: "https://play.google.com/store/apps/details?id=com.timesgroup.timesjobs",
      technologies: ["Flutter", "Firebase", "GetX"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Outspark - By the Times of India",
      description:
      "OutSpark is an AI-powered platform dedicated to enhancing job seekers' prospects by providing customized resumes and comprehensive interview preparation services",
      imageUrl: "outspark.png",
      liveLink: "https://play.google.com/store/apps/developer?id=CoolBoots+Media&hl=en_IN",
      technologies: ["Flutter", "Firebase", "Playstore"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Footasylum",
      description: "Get ready to experience Footasylum REWARDS, now better than ever! As a REWARDS member you’ll earn money back on every purchase and get access to rewards you won’t find anywhere else including exclusive perks and competitions!",
      imageUrl: "footasylum.png",
      githubLink: "https://play.google.com/store/apps/details?id=com.footasylum.footasylumapp&referrer=utm_source%3Dapkpure.com",
      technologies: ["SHopping", "Android"],
      type: ProjectType.android,
    ),
    Project(
      title: "Jenny Craig",
      description: "The Jenny Craig app is designed to support individuals on their weight loss journey by offering convenient access to the full Jenny Craig menu, allowing users to order meals anytime",
      imageUrl: "jenny.png",
      githubLink: "https://play.google.com/store/apps/details?id=com.wellful.jennycraig&hl=en_IN",
      technologies: ["Health", "Android"],
      type: ProjectType.android,
    ),
    Project(
      title: "Umo Mobility",
      description: "Umo is your travel companion, an all-in-one transit app that lets riders at agencies that utilize Umo buy transit passes, get directions, use map navigation, find your bus schedules, and move seamlessly wherever life takes you.",
      imageUrl: "umo.png",
      githubLink: "https://play.google.com/store/apps/details?id=com.cubic.ctp.app&hl=en_IN",
      technologies: ["Encryption", "Android"],
      type: ProjectType.android,
    ),
    Project(
      title: "AstroScope",
      description: "The comprehensive astrology and matchmaking app Astroscope offers a wide range of interesting features to its users.",
      imageUrl: "astro.png",
      githubLink: "https://play.google.com/store/apps/details?id=com.horoscope.kundli.astro.scope&hl=en_IN",
      technologies: ["Flutter", "Ads", "User Messaging Platform"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "BrainyGamez",
      description: "Experience a World of Puzzles: From brain teasers to logic games, we offer a diverse selection to keep your mind engaged",
      imageUrl: "brainy.png",
      githubLink: "https://play.google.com/store/apps/details?id=com.brainygamez.free.puzzle.games&hl=en_IN",
      technologies: ["Flutter", "Android", "UMP", "GDPR"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Find Fit People",
      description: "The Find Fit People app allows you to find the best in health, sports and fitness",
      imageUrl: "ffp.png",
      githubLink: "https://apkpure.net/find-fit-people/com.findfitpeople#google_vignette",
      technologies: ["Socket.IO", "Android"],
      type: ProjectType.android,
    ),

    Project(
      title: "Carcentro",
      description:
      "CRMT (Car refurbish Management Tool) is a mobile application that targets buyers of imported damaged cars (From USA to UAE). The idea is to give the end-user the ability to manage the cost / expenses of buying, repairing and selling damaged cars.",
      imageUrl: "carcentro.png",
      liveLink:
      "https://apkpure.net/carcentro/com.carscentro",
      technologies: ["Flutter", "GraphQL", "Playstore"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Streamcamp",
      description:
      "Streamcamp is a community for people who love streaming tv shows and movies. Our mission is to help people find and share web series & movies they love",
      imageUrl: "streamcamp.png",
      liveLink:
      "https://apkpure.net/streamcamp-what-you-watchin/streamcamp.app.community.ott",
      technologies: ["Flutter", "Movies", "Stories"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Coupanda",
      description:
      "Coupanda® is a user-curated deals and coupons app allowing users to select the types of deals they wish to explore, save, trash, or share with friends.",
      imageUrl: "coupanda.png",
      githubLink: "https://apkpure.net/coupanda/com.coupanda",
      technologies: ["Flutter", "Coupons"],
      type: ProjectType.flutter,
    ),

    Project(
      title: "Homevyte",
      description:
      "Connect with Trusted HomeCooks™ through our table-sharing app & enjoy a vast variety of fresh homemade, authentic & delicious American & ethnic cuisines locally",
      imageUrl: "homevyte.png",
      liveLink:
      "https://apkpure.net/homevyte/com.localbyte.userbyte",
      technologies: ["Flutter", "Firebase", "BLoc"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Homevyte Homecook",
      description:
          "Homevyte's HomeCook app allows you to share your home cooking with patrons while earning you a great income. It allows you to host guests & share your cuisines at your dining table, in your home. It’s the world’s first table-sharing app!",
      imageUrl: "homecook.png",
      liveLink:
      "https://apkpure.net/homevyte/com.localbyte.userbyte",
      technologies: ["Flutter", "Firebase", "BLoc"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "PrankPulse",
      description:
          "Endless Laughter at Your Fingertips: We've gathered the funniest, silliest, and downright hilarious sounds just for you. Whether it's classic, fart noise, or a nostalgic school bell ringing, we've got it all",
      imageUrl: "prank.png",
      liveLink:
          "https://play.google.com/store/apps/details?id=prank.funny.sounds.ca&hl=en_IN",
      technologies: ["Flutter", "Analytics", "Playstore"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "Rapid Racer",
      description:
          "Get ready for a fun ride in this super exciting car game where you need quick reflexes and amazing tapping skills! In this game, it's all about being skilled, speedy, and dodging traffic chaos",
      imageUrl: "rapid.png",
      liveLink: "https://play.google.com/store/apps/details?id=rapid.racer.cargames.ca&hl=en_IN",
      technologies: ["Flutter", "Firebase", "Analytics"],
      type: ProjectType.flutter,
    ),
    Project(
      title: "TouchPass Transit",
      description:
          " TouchPass lets you buy passes and other fare products with a few taps on your mobile device anytime, anywhere, for any participating agency",
      imageUrl: "touchpass.png",
      liveLink: "https://apkpure.net/touchpass-transit/com.delerrok.touchpass",
      technologies: ["Android", "QR", "Analytics", "NFC"],
      type: ProjectType.android,
    ),
    Project(
      title: "100+ mini apps (Tools and games)",
      description:
      "Developed under Coolboots, these mini apps were either tool apps or mini games. KEy features are GDPR, UMP Consent Form for Ads and data policy in EU and US.",
      imageUrl: "mini.png",
      liveLink: "https://play.google.com/store/apps/details?id=rapid.racer.cargames.ca&hl=en_IN",
      technologies: ["Flutter", "Firebase", "Analytics", "UMP", "GDPR"],
      type: ProjectType.flutter,
    ),


    // Add more projects...
  ];

  List<Project> get filteredProjects {
    if (selectedFilter == 'all') return allProjects;
    return allProjects.where((project) {
      switch (selectedFilter) {
        case 'flutter':
          return project.type == ProjectType.flutter;
        case 'android':
          return project.type == ProjectType.android;
        case 'designs':
          return project.type == ProjectType.design;
        default:
          return true;
      }
    }).toList();
  }

  Widget _buildFilterButton(String filter, String label, BuildContext context) {
    bool isSelected = selectedFilter == filter;
    bool isFirst = filter == 'all';
    bool isLast = filter == 'android';

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedFilter = filter),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? 8.0 : 12.0,
          ),
          decoration: BoxDecoration(
            color: isSelected ? buttonColor : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: isFirst ? const Radius.circular(24.0) : Radius.zero,
              right: isLast ? const Radius.circular(24.0) : Radius.zero,
            ),
            border: Border.all(
              color: isSelected ? buttonColor : Colors.grey.withAlpha(100),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: normalText(
                Responsive.isMobile(context) ? 14 : 16,
                textColor: isSelected ? Colors.white : buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = Responsive.isMobile(context);
        Responsive.isTablet(context);
        final padding = constraints.maxWidth > 1200
            ? 80.0
            : constraints.maxWidth > 600
                ? 40.0
                : 16.0;

        return Container(
          color: const Color(0xFF1E1E1E),
          padding: EdgeInsets.symmetric(
            horizontal: padding,
            vertical: isMobile ? 32 : 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Projects",
                style: titleText(isMobile ? 32 : 48).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "From Concept to Creation",
                style: normalText(isMobile ? 14 : 16).copyWith(
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: isMobile ? 32 : 48),

              // Filter buttons with improved layout
              Container(
                width: constraints.maxWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * (isMobile ? 0.05 : 0.15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFilterButton('all', 'All', context),
                    _buildFilterButton('flutter', 'Flutter', context),
                    _buildFilterButton('android', 'Android', context),
                  ],
                ),
              ),

              SizedBox(height: isMobile ? 32 : 48),

              // Projects grid with optimized aspect ratios
              Responsive(
                mobile: ProjectGrid(
                  crossAxisCount: 1,
                  childAspectRatio: 1.2,
                  projects: filteredProjects,
                ),
                tablet: ProjectGrid(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  projects: filteredProjects,
                ),
                desktop: ProjectGrid(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                  projects: filteredProjects,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<Project> projects;

  const ProjectGrid({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: Responsive.isMobile(context) ? 16 : 24,
        mainAxisSpacing: Responsive.isMobile(context) ? 16 : 24,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  void _handleTap() {
    if (widget.project.liveLink != null) {
      launchUrlString(widget.project.liveLink!);
    } else if (widget.project.githubLink != null) {
      launchUrlString(widget.project.githubLink!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) {
        if (Responsive.isDesktop(context)) {
          setState(() => isHovered = true);
        }
      },
      onExit: (_) {
        if (Responsive.isDesktop(context)) {
          setState(() => isHovered = false);
        }
      },
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(isHovered ? 1.03 : 1.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF2D2D2D),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(51),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.0),
                                Colors.black.withOpacity(0.5),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds),
                            blendMode: BlendMode.darken,
                            child: Image.asset(
                              widget.project.imageUrl,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (isHovered || isMobile)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (widget.project.githubLink != null)
                                  _buildIconButton(
                                    Icons.code,
                                    () => launchUrlString(
                                      widget.project.githubLink!,
                                    ),
                                  ),
                                if (widget.project.liveLink != null)
                                  _buildIconButton(
                                    Icons.launch,
                                    () => launchUrlString(
                                      widget.project.liveLink!,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Content Section
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: titleText(isMobile ? 16 : 18).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            widget.project.description,
                            style: normalText(isMobile ? 12 : 14).copyWith(
                              color: Colors.white70,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          children: widget.project.technologies.map((tech) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: 8, bottom: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: buttonColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: buttonColor.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  tech,
                                  style: TextStyle(
                                    fontSize: isMobile ? 10 : 12,
                                    color: buttonColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onPressed,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 36,
        ),
      ),
    );
  }
}
