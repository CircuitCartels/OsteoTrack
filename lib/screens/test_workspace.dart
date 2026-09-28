import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';
import '../models/screening.dart';
import '../services/gait_sensor_service.dart';
import 'report_view.dart';

class TestWorkspace extends StatefulWidget {
  const TestWorkspace({super.key});
  @override
  State<TestWorkspace> createState() => _TestWorkspaceState();
}

class _TestWorkspaceState extends State<TestWorkspace> {
  final _svc = GaitSensorService();
  final List<double> _v = [];
  final List<double> _m = [];
  double _meters = 0, _secs = 0;
  Timer? _t;
  int _steady = 0;

  @override
  void initState() {
    super.initState();
    _t = Timer.periodic(const Duration(milliseconds: 100), (t) {
      _secs += 0.1;
      _meters += 0.1; // ~1 m/s natural pace
      if (_meters >= 2 && _meters <= 8) _steady++;
      setState(() {
        _v.add(_svc.accelSample(_secs, _meters));
        _m.add(_meters);
        if (_v.length > 140) {
          _v.removeAt(0);
          _m.removeAt(0);
        }
      });
      if (_meters >= 10) {
        t.cancel();
        final f = _svc.extract(Session.symptoms?.total ?? 0, _steady);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ReportView(features: f)));
      }
    });
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Lang(builder: (c) {
        final phase = _meters < 2 ? 'p_acc' : (_meters > 8 ? 'p_dec' : 'p_ss');
        return Scaffold(
          appBar: AppBar(title: const Text('10MWT'), actions: [langPicker(), const SizedBox(width: 8)]),
          body: Column(children: [
            const Disclaimer(),
            Padding(padding: const EdgeInsets.all(16), child: Text(AppStrings.t('walking'), style: const TextStyle(fontSize: 16))),
            LinearProgressIndicator(value: (_meters / 10).clamp(0, 1).toDouble(), minHeight: 10),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('${AppStrings.t('time')}: ${_secs.toStringAsFixed(1)} s   |   ${_meters.clamp(0, 10).toStringAsFixed(1)} / 10 m', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Chip(label: Text(AppStrings.t(phase)), backgroundColor: phase == 'p_ss' ? Colors.green.shade100 : Colors.grey.shade300),
            const SizedBox(height: 12),
            Expanded(child: Padding(padding: const EdgeInsets.all(12), child: CustomPaint(size: Size.infinite, painter: _Wave(_v, _m)))),
          ]),
        );
      });
}

class _Wave extends CustomPainter {
  final List<double> v, m;
  _Wave(this.v, this.m);
  @override
  void paint(Canvas c, Size s) {
    c.drawRect(Offset.zero & s, Paint()..color = Colors.grey.shade100);
    if (v.length < 2) return;
    final dx = s.width / 140;
    for (var i = 1; i < v.length; i++) {
      final steady = m[i] >= 2 && m[i] <= 8;
      final p = Paint()..color = steady ? Colors.teal : Colors.grey..strokeWidth = 2;
      c.drawLine(Offset((i - 1) * dx, s.height / 2 - v[i - 1] * s.height / 5),
          Offset(i * dx, s.height / 2 - v[i] * s.height / 5), p);
    }
  }
  @override
  bool shouldRepaint(_Wave o) => true;
}
