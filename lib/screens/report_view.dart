import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../l10n/app_strings.dart';
import '../models/screening.dart';
import '../services/gait_sensor_service.dart';
import '../services/prediction_service.dart';
import '../widgets/feature_importance_bar.dart';

class ReportView extends StatefulWidget {
  final GaitFeatures features;
  const ReportView({super.key, required this.features});
  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  late final RiskResult _r;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    final p = Session.patient!;
    final s = Session.symptoms!;
    _r = TensorFlowLiteEdgePredictionService().predict(s.total, widget.features, p.age);
    final f = widget.features;
    DatabaseHelper.instance
        .saveScreening(p, (pid) => Screening(
              patientId: pid, answers: s.answers.join(','), symptomScore: s.total,
              flexion: f.flexion, cadence: f.cadence, symmetry: f.symmetry,
              smoothness: f.smoothness, consistency: f.consistency, tier: _r.tier,
              confidence: _r.confidence, advice: 'rec_${_r.tier}', createdAt: DateTime.now().toIso8601String()))
        .then((_) => mounted ? setState(() => _saved = true) : null)
        .catchError((_) => null);
  }

  DataRow _row(String k, double val, String unit, String ref, bool ok) => DataRow(cells: [
        DataCell(Text(AppStrings.t(k), style: const TextStyle(fontSize: 12))),
        DataCell(Text('${val.toStringAsFixed(1)}$unit', style: TextStyle(fontWeight: FontWeight.bold, color: ok ? Colors.green.shade800 : Colors.red.shade700))),
        DataCell(Text(ref, style: const TextStyle(fontSize: 12))),
      ]);

  @override
  Widget build(BuildContext context) => Lang(builder: (c) {
        final f = widget.features;
        final col = _r.tier == 'low' ? Colors.green : (_r.tier == 'med' ? Colors.orange : Colors.red);
        DataRow row(String k, double val, String unit, String ref, bool ok) => _row(k, val, unit, ref, ok);
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.t('report')), actions: [langPicker(), const SizedBox(width: 8)]),
          body: Column(children: [
            const Disclaimer(),
            Expanded(
              child: ListView(padding: const EdgeInsets.all(16), children: [
                Card(
                  color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: BorderSide(color: col, width: 2.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Text(AppStrings.t(_r.tier), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: col.shade700)),
                      Text('${AppStrings.t('conf')}: ${_r.confidence.toStringAsFixed(0)}%'),
                      if (_saved) Text(AppStrings.t('saved'), style: const TextStyle(fontSize: 12)),
                    ]),
                  ),
                ),
                const SizedBox(height: 12),
                Text(AppStrings.t('feat'), style: const TextStyle(fontWeight: FontWeight.bold)),
                DataTable(columnSpacing: 16, columns: [
                  DataColumn(label: Text(AppStrings.t('featcol'))),
                  DataColumn(label: Text(AppStrings.t('measured'))),
                  DataColumn(label: Text(AppStrings.t('ref'))),
                ], rows: [
                  row('f1', f.flexion, '°', '> 60°', f.flexion > 60),
                  row('f2', f.cadence, ' spm', '90 - 120', f.cadence >= 90 && f.cadence <= 120),
                  row('f3', f.symmetry, '%', '> 90.0%', f.symmetry > 90),
                  row('f4', f.smoothness, '/100', '> 80/100', f.smoothness > 80),
                  row('f5', f.consistency, '%', '> 85.0%', f.consistency > 85),
                ]),
                const SizedBox(height: 12),
                Text(AppStrings.t('top'), style: const TextStyle(fontWeight: FontWeight.bold)),
                FeatureImportanceBar(label: AppStrings.t('c1'), percent: 40, color: Colors.teal),
                FeatureImportanceBar(label: AppStrings.t('c2'), percent: 40, color: Colors.indigo),
                FeatureImportanceBar(label: AppStrings.t('c3'), percent: 20, color: Colors.amber.shade800),
                const SizedBox(height: 12),
                Text(AppStrings.t('recs'), style: const TextStyle(fontWeight: FontWeight.bold)),
                Card(child: Padding(padding: const EdgeInsets.all(12), child: Text(AppStrings.t('rec_${_r.tier}')))),
                const SizedBox(height: 12),
                OutlinedButton(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), child: Text(AppStrings.t('newtest'))),
              ]),
            ),
          ]),
        );
      });
}
