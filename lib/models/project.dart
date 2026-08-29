import 'package:flutter/material.dart';

enum ProjectType {
  flutter,
  android,
  design,
}

enum ProjectFilter {
  all,
  featured,
  flutter,
  android,
  ai,
  payments,
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String? githubLink;
  final String? liveLink;
  final List<String> technologies;
  final ProjectType type;
  final String category;
  final bool featured;
  final bool isAi;
  final bool isPayments;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.githubLink,
    this.liveLink,
    required this.technologies,
    required this.type,
    this.category = '',
    this.featured = false,
    this.isAi = false,
    this.isPayments = false,
  });

  String? get primaryLink => liveLink ?? githubLink;

  bool matches(ProjectFilter filter) {
    switch (filter) {
      case ProjectFilter.all:
        return true;
      case ProjectFilter.featured:
        return featured;
      case ProjectFilter.flutter:
        return type == ProjectType.flutter;
      case ProjectFilter.android:
        return type == ProjectType.android;
      case ProjectFilter.ai:
        return isAi;
      case ProjectFilter.payments:
        return isPayments;
    }
  }
}

class CareerStop {
  final String years;
  final String role;
  final String company;
  final String summary;
  final bool current;

  const CareerStop({
    required this.years,
    required this.role,
    required this.company,
    required this.summary,
    this.current = false,
  });
}

class TechCategory {
  final String title;
  final IconData icon;
  final String? description;
  final List<TechItem> items;

  const TechCategory({
    required this.title,
    required this.icon,
    this.description,
    required this.items,
  });
}

class TechItem {
  final String label;
  final IconData? icon;

  const TechItem(this.label, {this.icon});
}

class WhatIDoItem {
  final String title;
  final IconData icon;
  final List<String> points;

  const WhatIDoItem({
    required this.title,
    required this.icon,
    required this.points,
  });
}
