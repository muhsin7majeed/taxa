import 'package:flutter/material.dart';

enum AppDestination {
  capture,
  collection,
  checklists,
  account;

  String get label {
    return switch (this) {
      AppDestination.capture => 'Capture',
      AppDestination.collection => 'Collection',
      AppDestination.checklists => 'Checklists',
      AppDestination.account => 'Account',
    };
  }

  IconData get icon {
    return switch (this) {
      AppDestination.capture => Icons.photo_camera_outlined,
      AppDestination.collection => Icons.collections_bookmark_outlined,
      AppDestination.checklists => Icons.checklist_outlined,
      AppDestination.account => Icons.person_outline,
    };
  }

  IconData get selectedIcon {
    return switch (this) {
      AppDestination.capture => Icons.photo_camera,
      AppDestination.collection => Icons.collections_bookmark,
      AppDestination.checklists => Icons.checklist,
      AppDestination.account => Icons.person,
    };
  }

  NavigationDestination get navigationDestination {
    return NavigationDestination(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      label: label,
    );
  }
}
