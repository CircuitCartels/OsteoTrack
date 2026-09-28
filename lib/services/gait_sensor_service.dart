import 'dart:math';

class GaitFeatures {
  final double flexion, cadence, symmetry, smoothness, consistency;
  const GaitFeatures(this.flexion, this.cadence, this.symmetry, this.smoothness, this.consistency);
}

/// Simulated IMU stream + feature extraction (replace with BLE data from ESP32).
class GaitSensorService {
  final Random _r = Random();

  Stream<double> tiltStream() {
    final sw = Stopwatch()..start();
    return Stream.periodic(const Duration(milliseconds: 80), (_) {
      final t = sw.elapsedMilliseconds / 1000.0;
      final v = 15 * sin(t * 0.9) * cos(t * 0.23) + (_r.nextDouble() - 0.5);
      return v.clamp(-15.0, 15.0).toDouble();
    });
  }

  /// Acceleration sample; amplitude ramps up in 0-2 m and down in 8-10 m.
  double accelSample(double t, double meters) {
    final amp = meters < 2 ? 0.4 + meters * 0.3 : (meters > 8 ? 1.0 - (meters - 8) * 0.3 : 1.0);
    return amp * (sin(t * 12) + 0.4 * sin(t * 27)) + (_r.nextDouble() - 0.5) * 0.3;
  }

  double _c(double v, double lo, double hi) => v.clamp(lo, hi).toDouble();
  double _n(double a) => (_r.nextDouble() - 0.5) * 2 * a;

  /// Features from the steady-state segment only; demo values scale with symptom burden.
  GaitFeatures extract(int symptomTotal, int steadySampleCount) {
    final s = symptomTotal / 15.0;
    return GaitFeatures(
      _c(70 - 28 * s + _n(3), 20, 120),
      _c(108 - 32 * s + _n(3), 50, 140),
      _c(96 - 22 * s + _n(2), 50, 100),
      _c(90 - 32 * s + _n(3), 10, 100),
      _c(94 - 28 * s + _n(3), 30, 100),
    );
  }
}
