// ============================================================
// lib/app.dart
// ============================================================

import 'package:flutter/material.dart';
import 'features/search/ui/search_screen.dart';

class GitHubSearchApp extends StatelessWidget {
  const GitHubSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const SearchScreen(),
    );
  }
}
