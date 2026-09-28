import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';
import 'about.dart';
import 'dashboard.dart';
import 'preventive_portal.dart';
import 'reports.dart';

class HomeHolder extends StatefulWidget {
  const HomeHolder({super.key});
  @override
  State<HomeHolder> createState() => _HomeHolderState();
}

class _HomeHolderState extends State<HomeHolder> {
  int _i = 0;
  @override
  Widget build(BuildContext context) => Lang(builder: (c) {
        final pages = [Dashboard(onOpenReports: () => setState(() => _i = 1)), const ReportsScreen(), const PreventivePortal(), const AboutScreen()];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(children: [
              Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: const Color(0xFF0D6E6E), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.accessibility_new, color: Colors.white, size: 20)),
              const SizedBox(width: 8),
              const Text('OsteoTrack', style: TextStyle(color: Color(0xFF0D6E6E), fontWeight: FontWeight.w900, fontSize: 22)),
            ]),
            actions: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFDDE6FF), borderRadius: BorderRadius.circular(12)), child: Text(AppStrings.t('demo'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF2456D6)))),
              const SizedBox(width: 6),
              langPicker(),
              const SizedBox(width: 8),
            ],
          ),
          body: Column(children: [const Disclaimer(), Expanded(child: pages[_i])]),
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: _i,
            onDestinationSelected: (v) => setState(() => _i = v),
            destinations: [
              NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: AppStrings.t('home')),
              NavigationDestination(icon: const Icon(Icons.description_outlined), selectedIcon: const Icon(Icons.description), label: AppStrings.t('tab_reports')),
              NavigationDestination(icon: const Icon(Icons.spa_outlined), selectedIcon: const Icon(Icons.spa), label: AppStrings.t('prevent')),
              NavigationDestination(icon: const Icon(Icons.info_outline), selectedIcon: const Icon(Icons.info), label: AppStrings.t('tab_about')),
            ],
          ),
        );
      });
}
