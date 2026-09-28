import 'package:flutter/material.dart';

class FeatureImportanceBar extends StatelessWidget {
  final String label;
  final double percent;
  final Color color;
  const FeatureImportanceBar({super.key, required this.label, required this.percent, required this.color});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(fontSize: 13))),
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(value: percent / 100, minHeight: 14, color: color, backgroundColor: Colors.grey.shade200))),
          SizedBox(width: 44, child: Text('  ${percent.toStringAsFixed(0)}%')),
        ]),
      );
}
