import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';
import '../services/gait_sensor_service.dart';
import '../widgets/bubble_level.dart';
import 'test_workspace.dart';

class CalibrationScreen extends StatefulWidget {
  const CalibrationScreen({super.key});
  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen> {
  double _angle = 15;
  StreamSubscription<double>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = GaitSensorService().tiltStream().listen((v) => setState(() => _angle = v));
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Lang(builder: (c) {
        final ok = _angle.abs() <= 3;
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.t('calib')), actions: [langPicker(), const SizedBox(width: 8)]),
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            color: ok ? Colors.green.shade50 : Colors.amber.shade200,
            child: Column(children: [
              const Disclaimer(),
              const Spacer(),
              BubbleLevel(angle: _angle),
              const SizedBox(height: 16),
              Text('${_angle.toStringAsFixed(1)}°', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Text(ok ? AppStrings.t('ok') : AppStrings.t('mis'), style: TextStyle(fontSize: 16, color: ok ? Colors.green.shade800 : Colors.orange.shade900)),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: FilledButton.icon(
                  icon: const Icon(Icons.directions_walk),
                  label: Text(AppStrings.t('start')),
                  onPressed: ok ? () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TestWorkspace())) : null,
                ),
              ),
            ]),
          ),
        );
      });
}
