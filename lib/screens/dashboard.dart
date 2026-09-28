import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';
import 'symptom_form.dart';

class Dashboard extends StatelessWidget {
  final VoidCallback onOpenReports;
  const Dashboard({super.key, required this.onOpenReports});

  Widget _step(IconData i, String k, int n) => Expanded(
        child: Column(children: [
          CircleAvatar(radius: 24, backgroundColor: const Color(0xFFD5EEEE), child: Icon(i, color: const Color(0xFF0D6E6E))),
          const SizedBox(height: 6),
          Text('$n. ${AppStrings.t(k)}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ]),
      );

  @override
  Widget build(BuildContext context) => Lang(
        builder: (c) => ListView(padding: const EdgeInsets.all(20), children: [
          Text(AppStrings.t('hero'), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.15, color: Color(0xFF0F1F26))),
          const SizedBox(height: 20),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFF0D6E6E)),
            icon: const Icon(Icons.play_arrow),
            label: Text(AppStrings.t('start_new')),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SymptomForm())),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(icon: const Icon(Icons.folder_open), label: Text(AppStrings.t('prev')), onPressed: onOpenReports),
          const SizedBox(height: 16),
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
            const Icon(Icons.lightbulb_outline, color: Color(0xFF0D6E6E)),
            const SizedBox(width: 14),
            Expanded(child: Text(AppStrings.t('info'), style: const TextStyle(fontSize: 15, height: 1.4))),
          ]))),
          const SizedBox(height: 24),
          Text(AppStrings.t('steps'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 12),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _step(Icons.tune, 's1', 1), _step(Icons.directions_walk, 's2', 2), _step(Icons.psychology, 's3', 3), _step(Icons.assignment_turned_in, 's4', 4),
          ]),
        ]),
      );
}
