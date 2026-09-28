import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';
import '../models/patient.dart';
import '../models/screening.dart';
import '../models/symptoms.dart';
import 'calibration.dart';

class SymptomForm extends StatefulWidget {
  const SymptomForm({super.key});
  @override
  State<SymptomForm> createState() => _SymptomFormState();
}

class _SymptomFormState extends State<SymptomForm> {
  final _name = TextEditingController();
  final _age = TextEditingController(text: '55');
  String _gender = 'female';
  final List<double> _a = [0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) => Lang(builder: (c) {
        final total = _a.fold<double>(0, (x, y) => x + y).round();
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.t('start_new')), actions: [langPicker(), const SizedBox(width: 8)]),
          body: Column(children: [
            const Disclaimer(),
            Expanded(
              child: ListView(padding: const EdgeInsets.all(16), children: [
                TextField(controller: _name, decoration: InputDecoration(labelText: AppStrings.t('name'), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(child: TextField(controller: _age, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: AppStrings.t('age'), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))))),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _gender,
                      decoration: InputDecoration(labelText: AppStrings.t('gender'), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
                      items: ['male', 'female', 'other'].map((g) => DropdownMenuItem(value: g, child: Text(AppStrings.t(g)))).toList(),
                      onChanged: (v) => setState(() => _gender = v ?? 'female'),
                    ),
                  ),
                ]),
                const SizedBox(height: 12),
                for (var i = 0; i < 5; i++)
                  Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                      child: Column(children: [
                        Row(children: [
                          Expanded(child: Text('${i + 1}. ${AppStrings.t('q${i + 1}')}', style: const TextStyle(fontWeight: FontWeight.w700))),
                          Chip(label: Text('${_a[i].round()} · ${AppStrings.t('l${_a[i].round()}')}'), visualDensity: VisualDensity.compact, backgroundColor: [Colors.green.shade50, Colors.yellow.shade100, Colors.orange.shade100, Colors.red.shade100][_a[i].round()]),
                        ]),
                        Slider(value: _a[i], min: 0, max: 3, divisions: 3, onChanged: (v) => setState(() => _a[i] = v)),
                      ]),
                    ),
                  ),
              ]),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: Row(children: [
                Expanded(child: Text('${AppStrings.t('score')}\n$total / 15', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800))),
                Expanded(
                  flex: 2,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: const Color(0xFF0D6E6E)),
                    icon: const Icon(Icons.arrow_forward),
                    label: Text(AppStrings.t('next')),
                    onPressed: () {
                      Session.patient = Patient(name: _name.text.trim().isEmpty ? 'Patient' : _name.text.trim(), age: int.tryParse(_age.text) ?? 50, gender: _gender);
                      Session.symptoms = Symptoms(_a.map((e) => e.round()).toList());
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CalibrationScreen()));
                    },
                  ),
                ),
              ]),
            ),
          ]),
        );
      });
}
