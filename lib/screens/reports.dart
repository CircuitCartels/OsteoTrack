import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../l10n/app_strings.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  Color _col(String t) => t == 'low' ? Colors.green : (t == 'med' ? Colors.orange : Colors.red);

  @override
  Widget build(BuildContext context) => Lang(
        builder: (c) => FutureBuilder<List<Map<String, Object?>>>(
          future: DatabaseHelper.instance.history(),
          builder: (c, snap) {
            if (!snap.hasData) return const Center(child: CircularProgressIndicator());
            final rows = snap.data!;
            if (rows.isEmpty) {
              return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.folder_open, size: 64, color: Colors.grey.shade400),
                const SizedBox(height: 10),
                Text(AppStrings.t('empty'), style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
              ]));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: rows.length,
              itemBuilder: (c, i) {
                final r = rows[i];
                final tier = r['tier'] as String;
                final date = (r['created_at'] as String).substring(0, 16).replaceFirst('T', '  ');
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),
                    leading: CircleAvatar(backgroundColor: _col(tier).withOpacity(0.15), child: Icon(Icons.monitor_heart, color: _col(tier))),
                    title: Text('${r['name']}, ${r['age']}', style: const TextStyle(fontWeight: FontWeight.w800)),
                    subtitle: Text('$date\n${AppStrings.t('score')}: ${r['symptom_score']}/15'),
                    isThreeLine: true,
                    trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(AppStrings.t(tier), style: TextStyle(fontWeight: FontWeight.w900, color: _col(tier), fontSize: 12)),
                      Text('${(r['confidence'] as num).toStringAsFixed(0)}%'),
                    ]),
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('${r['name']}'),
                        content: Text('${AppStrings.t('f1')}: ${(r['flexion'] as num).toStringAsFixed(1)}°\n${AppStrings.t('f2')}: ${(r['cadence'] as num).toStringAsFixed(1)}\n${AppStrings.t('f3')}: ${(r['symmetry'] as num).toStringAsFixed(1)}%\n${AppStrings.t('f4')}: ${(r['smoothness'] as num).toStringAsFixed(1)}/100\n${AppStrings.t('f5')}: ${(r['consistency'] as num).toStringAsFixed(1)}%\n\n${AppStrings.t(r['advice'] as String)}'),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(AppStrings.t('close')))],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
}
