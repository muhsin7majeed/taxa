import 'package:flutter/material.dart';

import '../core/theme/taxa_theme.dart';
import 'navigation/taxa_shell.dart';

class TaxaApp extends StatelessWidget {
  const TaxaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxa',
      debugShowCheckedModeBanner: false,
      theme: TaxaTheme.light(),
      darkTheme: TaxaTheme.dark(),
      themeMode: ThemeMode.system,
      home: const TaxaShell(),
    );
  }
}
