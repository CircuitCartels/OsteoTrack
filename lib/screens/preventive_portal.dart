import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';

class PreventivePortal extends StatelessWidget {
  const PreventivePortal({super.key});
  @override
  Widget build(BuildContext context) => Lang(builder: (c) {
        const items = [
          ['t_joint', 'b_joint', Icons.accessibility_new],
          ['t_act', 'b_act', Icons.directions_walk],
          ['t_nut', 'b_nut', Icons.restaurant],
          ['t_life', 'b_life', Icons.monitor_weight],
        ];
        return ListView(padding: const EdgeInsets.all(12), children: [
          for (final i in items)
            Card(
              child: ExpansionTile(
                leading: Icon(i[2] as IconData, color: Colors.teal),
                title: Text(AppStrings.t(i[0] as String), style: const TextStyle(fontWeight: FontWeight.w600)),
                initiallyExpanded: i[0] == 't_joint',
                childrenPadding: const EdgeInsets.all(14),
                children: [Text(AppStrings.t(i[1] as String))],
              ),
            ),
        ]);
      });
}
