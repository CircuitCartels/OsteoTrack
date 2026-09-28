import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) => Lang(
        builder: (c) => ListView(padding: const EdgeInsets.all(20), children: [
          Text(AppStrings.t('about_t'), style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Text(AppStrings.t('about_b'), style: const TextStyle(fontSize: 15, height: 1.5)))),
          const SizedBox(height: 10),
          Card(child: ListTile(leading: const Icon(Icons.groups, color: Color(0xFF0D6E6E)), title: Text(AppStrings.t('about_team')))),
          Card(child: ListTile(leading: const Icon(Icons.translate, color: Color(0xFF0D6E6E)), title: Text(AppStrings.t('lang_note'), style: const TextStyle(fontSize: 13)))),
        ]),
      );
}
