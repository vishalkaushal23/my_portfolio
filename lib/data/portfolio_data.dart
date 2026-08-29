import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';

class PortfolioData {
  static const List<Project> projects = [
    Project(
      title: 'TimesJobs: Alerts & Job Search',
      description:
          'Find your dream job with TimesJobs — alerts, search, and a fast mobile hiring experience used at scale.',
      imageUrl: 'times.png',
      liveLink:
          'https://play.google.com/store/apps/details?id=com.timesgroup.timesjobs',
      technologies: ['Flutter', 'Firebase', 'GetX', 'REST API'],
      type: ProjectType.flutter,
      category: 'Job Search Platform',
      featured: true,
    ),
    Project(
      title: 'Outspark - By the Times of India',
      description:
          'AI-powered career platform that builds customised resumes and interview prep for job seekers.',
      imageUrl: 'outspark.png',
      liveLink:
          'https://play.google.com/store/apps/developer?id=CoolBoots+Media&hl=en_IN',
      technologies: ['Flutter', 'Firebase', 'OpenAI'],
      type: ProjectType.flutter,
      category: 'AI Career Platform',
      featured: true,
      isAi: true,
    ),
    Project(
      title: 'Umo Mobility',
      description:
          'All-in-one transit companion for passes, directions, maps, and schedules — wherever life takes you.',
      imageUrl: 'umo.png',
      githubLink:
          'https://play.google.com/store/apps/details?id=com.cubic.ctp.app&hl=en_IN',
      technologies: ['Android', 'Maps', 'Payments'],
      type: ProjectType.android,
      category: 'Transit & Mobility',
      featured: true,
      isPayments: true,
    ),
    Project(
      title: 'Footasylum',
      description:
          'Rewards membership app — earn on every purchase and unlock exclusive perks, drops, and competitions.',
      imageUrl: 'footasylum.png',
      githubLink:
          'https://play.google.com/store/apps/details?id=com.footasylum.footasylumapp&referrer=utm_source%3Dapkpure.com',
      technologies: ['Shopping', 'Android'],
      type: ProjectType.android,
      category: 'Retail & Rewards',
    ),
    Project(
      title: 'Jenny Craig',
      description:
          'Health app for the full Jenny Craig menu — order meals anytime and stay on a weight-loss journey.',
      imageUrl: 'jenny.png',
      githubLink:
          'https://play.google.com/store/apps/details?id=com.wellful.jennycraig&hl=en_IN',
      technologies: ['Health', 'Android'],
      type: ProjectType.android,
      category: 'Health & Wellness',
    ),
    Project(
      title: 'AstroScope',
      description:
          'Astrology and matchmaking app with a wide range of daily insights and user messaging features.',
      imageUrl: 'astro.png',
      githubLink:
          'https://play.google.com/store/apps/details?id=com.horoscope.kundli.astro.scope&hl=en_IN',
      technologies: ['Flutter', 'UMP'],
      type: ProjectType.flutter,
      category: 'Lifestyle',
    ),
    Project(
      title: 'BrainyGamez',
      description:
          'A world of puzzles — brain teasers and logic games designed to keep minds engaged.',
      imageUrl: 'brainy.png',
      githubLink:
          'https://play.google.com/store/apps/details?id=com.brainygamez.free.puzzle.games&hl=en_IN',
      technologies: ['Flutter', 'UMP', 'GDPR'],
      type: ProjectType.flutter,
      category: 'Games',
    ),
    Project(
      title: 'Find Fit People',
      description:
          'Discover the best in health, sports, and fitness — connect with people who train like you.',
      imageUrl: 'ffp.png',
      githubLink:
          'https://apkpure.net/find-fit-people/com.findfitpeople#google_vignette',
      technologies: ['Socket.IO', 'Android'],
      type: ProjectType.android,
      category: 'Health & Fitness',
    ),
    Project(
      title: 'Carcentro',
      description:
          'CRMT helps buyers of imported damaged cars manage cost, repair, and resale from purchase to sale.',
      imageUrl: 'carcentro.png',
      liveLink: 'https://apkpure.net/carcentro/com.carscentro',
      technologies: ['Flutter', 'GraphQL'],
      type: ProjectType.flutter,
      category: 'Automotive',
    ),
    Project(
      title: 'Streamcamp',
      description:
          'Community for people who love streaming shows and movies — find and share what you are watching.',
      imageUrl: 'streamcamp.png',
      liveLink:
          'https://apkpure.net/streamcamp-what-you-watchin/streamcamp.app.community.ott',
      technologies: ['Flutter', 'Movies'],
      type: ProjectType.flutter,
      category: 'Entertainment',
    ),
    Project(
      title: 'Coupanda',
      description:
          'User-curated deals and coupons — explore, save, and share the offers that actually matter.',
      imageUrl: 'coupanda.png',
      githubLink: 'https://apkpure.net/coupanda/com.coupanda',
      technologies: ['Flutter', 'Coupons'],
      type: ProjectType.flutter,
      category: 'Deals & Coupons',
      isPayments: true,
    ),
    Project(
      title: 'Homevyte',
      description:
          'Table-sharing app to connect with trusted home cooks and enjoy authentic homemade cuisine nearby.',
      imageUrl: 'homevyte.png',
      liveLink: 'https://apkpure.net/homevyte/com.localbyte.userbyte',
      technologies: ['Flutter', 'Firebase', 'BLoC'],
      type: ProjectType.flutter,
      category: 'Food & Dining',
      isPayments: true,
    ),
    Project(
      title: 'Homevyte Homecook',
      description:
          'Host guests at your table, share your cuisine, and earn — the world’s first table-sharing cook app.',
      imageUrl: 'homecook.png',
      liveLink: 'https://apkpure.net/homevyte/com.localbyte.userbyte',
      technologies: ['Flutter', 'Firebase', 'BLoC'],
      type: ProjectType.flutter,
      category: 'Food & Dining',
    ),
    Project(
      title: 'PrankPulse',
      description:
          'Endless laughter at your fingertips — classic prank sounds, from school bells to the classics.',
      imageUrl: 'prank.png',
      liveLink:
          'https://play.google.com/store/apps/details?id=prank.funny.sounds.ca&hl=en_IN',
      technologies: ['Flutter', 'Analytics'],
      type: ProjectType.flutter,
      category: 'Entertainment',
    ),
    Project(
      title: 'Rapid Racer',
      description:
          'Reflex-driven car game — stay skilled, stay speedy, and dodge traffic chaos.',
      imageUrl: 'rapid.png',
      liveLink:
          'https://play.google.com/store/apps/details?id=rapid.racer.cargames.ca&hl=en_IN',
      technologies: ['Flutter', 'Firebase', 'Analytics'],
      type: ProjectType.flutter,
      category: 'Games',
    ),
    Project(
      title: 'TouchPass Transit',
      description:
          'Buy passes and fare products with a few taps, anytime, for participating transit agencies.',
      imageUrl: 'touchpass.png',
      liveLink: 'https://apkpure.net/touchpass-transit/com.delerrok.touchpass',
      technologies: ['Android', 'QR', 'NFC'],
      type: ProjectType.android,
      category: 'Transit & Payments',
      isPayments: true,
    ),
    Project(
      title: '100+ mini apps (Tools and games)',
      description:
          'A family of Coolboots mini tools and games with GDPR, UMP consent, and Play Store release pipelines.',
      imageUrl: 'mini.png',
      liveLink:
          'https://play.google.com/store/apps/details?id=rapid.racer.cargames.ca&hl=en_IN',
      technologies: ['Analytics', 'UMP', 'GDPR'],
      type: ProjectType.flutter,
      category: 'Tools & Games',
    ),
  ];

  static List<Project> get featured =>
      projects.where((project) => project.featured).toList();

  static const List<WhatIDoItem> whatIDo = [
    WhatIDoItem(
      title: 'Mobile Engineering',
      icon: Icons.phone_iphone_rounded,
      points: ['Flutter', 'Android', 'Kotlin', 'Dart', 'MVVM', 'Clean Arch'],
    ),
    WhatIDoItem(
      title: 'Technical Leadership',
      icon: Icons.groups_rounded,
      points: ['Mentoring', 'Code Reviews', 'Team Building', 'Estimation'],
    ),
    WhatIDoItem(
      title: 'Product Delivery',
      icon: Icons.rocket_launch_rounded,
      points: ['Sprint Execution', 'QA', 'Releases', 'Stakeholders'],
    ),
    WhatIDoItem(
      title: 'Production Excellence',
      icon: Icons.monitor_heart_outlined,
      points: ['Crashlytics', 'Analytics', 'ANR Monitoring', 'Play Console'],
    ),
  ];

  static const List<CareerStop> career = [
    CareerStop(
      years: '2015 — 2017',
      role: 'Android Developer',
      company: 'Native Android',
      summary: 'Shipped production Java/Kotlin apps and Play Store releases.',
    ),
    CareerStop(
      years: '2017 — 2019',
      role: 'Senior Android Developer',
      company: 'Product Engineering',
      summary: 'Owned architecture, performance, and complex feature delivery.',
    ),
    CareerStop(
      years: '2019 — 2022',
      role: 'Mobile Tech Lead',
      company: 'Flutter & Android',
      summary: 'Led Flutter adoption, mentoring, and multi-app delivery.',
    ),
    CareerStop(
      years: '2022 — Present',
      role: 'Senior Project Manager',
      company: 'Technical Leadership',
      summary: 'Ran mobile products, teams, and a 4 → 2 week delivery cycle.',
      current: true,
    ),
  ];

  static const List<TechCategory> techStack = [
    TechCategory(
      title: 'Mobile Development',
      icon: Icons.smartphone_rounded,
      items: [
        TechItem('Flutter', icon: Icons.flutter_dash),
        TechItem('Android', icon: Icons.android_rounded),
      ],
    ),
    TechCategory(
      title: 'Architecture & State Management',
      icon: Icons.account_tree_outlined,
      items: [
        TechItem('Clean Architecture'),
        TechItem('MVVM'),
        TechItem('MVI'),
        TechItem('BLoC'),
        TechItem('Cubit'),
        TechItem('Riverpod'),
        TechItem('Provider'),
        TechItem('GetX'),
        TechItem('Repository Pattern'),
      ],
    ),
    TechCategory(
      title: 'Modern Android Development',
      icon: Icons.android_rounded,
      items: [
        TechItem('Jetpack Compose'),
        TechItem('Coroutines'),
        TechItem('Flow'),
        TechItem('Room'),
        TechItem('WorkManager'),
        TechItem('Hilt / Dagger'),
        TechItem('Navigation Component'),
      ],
    ),
    TechCategory(
      title: 'APIs & Integrations',
      icon: Icons.hub_outlined,
      items: [
        TechItem('REST APIs', icon: Icons.api_rounded),
        TechItem('GraphQL', icon: Icons.share_outlined),
        TechItem('gRPC', icon: Icons.swap_horiz_rounded),
        TechItem('WebSockets', icon: Icons.wifi_tethering),
        TechItem('Socket.IO', icon: Icons.bolt_rounded),
        TechItem('Retrofit', icon: Icons.http_rounded),
        TechItem('OkHttp', icon: Icons.language_rounded),
        TechItem('Firebase', icon: Icons.local_fire_department_outlined),
      ],
    ),
    TechCategory(
      title: 'Advanced Mobile Capabilities',
      icon: Icons.sensors_rounded,
      items: [
        TechItem('BLE', icon: Icons.bluetooth_rounded),
        TechItem('Maps & Location', icon: Icons.map_outlined),
        TechItem('NFC', icon: Icons.nfc_rounded),
        TechItem('Deep Links', icon: Icons.link_rounded),
        TechItem('QR Payments', icon: Icons.qr_code_rounded),
        TechItem('Push Notifications', icon: Icons.notifications_outlined),
        TechItem('Barcode Scanning', icon: Icons.qr_code_scanner_rounded),
        TechItem('Mobile Payments', icon: Icons.payments_outlined),
      ],
    ),
    TechCategory(
      title: 'Data & Observability',
      icon: Icons.insights_rounded,
      items: [
        TechItem('Firebase Firestore', icon: Icons.storage_rounded),
        TechItem('Crashlytics', icon: Icons.bug_report_outlined),
        TechItem('Analytics', icon: Icons.bar_chart_rounded),
        TechItem('ANR Monitoring', icon: Icons.speed_rounded),
        TechItem('Google Play Console', icon: Icons.storefront_outlined),
        TechItem('SQLite', icon: Icons.table_chart_outlined),
      ],
    ),
    TechCategory(
      title: 'Engineering & DevOps',
      icon: Icons.terminal_rounded,
      items: [
        TechItem('Git', icon: Icons.merge_rounded),
        TechItem('GitHub', icon: Icons.code_rounded),
        TechItem('CI/CD', icon: Icons.sync_rounded),
        TechItem('SVN', icon: Icons.folder_copy_outlined),
        TechItem('Unit Testing', icon: Icons.verified_outlined),
        TechItem('Code Reviews', icon: Icons.rate_review_outlined),
        TechItem('Debugging', icon: Icons.bug_report_outlined),
        TechItem('Release Management', icon: Icons.inventory_2_outlined),
      ],
    ),
    TechCategory(
      title: 'Leadership & Delivery',
      icon: Icons.emoji_events_outlined,
      items: [
        TechItem('Team Leadership'),
        TechItem('Mentoring'),
        TechItem('Estimation'),
        TechItem('Sprint Planning'),
        TechItem('Stakeholder Management'),
      ],
    ),
  ];
}
