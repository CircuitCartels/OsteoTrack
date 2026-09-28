import 'dart:math';
import 'dart:typed_data';
import 'gait_sensor_service.dart';

class RiskResult {
  final String tier; // low / med / high
  final double confidence; // percent
  final double score; // 0..1
  const RiskResult(this.tier, this.confidence, this.score);
}

abstract class PredictionService {
  RiskResult predict(int symptomScore, GaitFeatures f, int age);
}

/// Simulated TFLite edge model: builds a normalised input tensor and runs a fixed-weight layer.
class TensorFlowLiteEdgePredictionService implements PredictionService {
  double _d(double v, double ref) => ((ref - v) / ref).clamp(0.0, 1.0).toDouble();

  @override
  RiskResult predict(int symptomScore, GaitFeatures f, int age) {
    final input = Float32List(7)
      ..[0] = symptomScore / 15
      ..[1] = _d(f.flexion, 60)
      ..[2] = _d(f.cadence, 90)
      ..[3] = _d(f.symmetry, 90)
      ..[4] = _d(f.smoothness, 80)
      ..[5] = _d(f.consistency, 85)
      ..[6] = ((age - 30) / 50).clamp(0.0, 1.0).toDouble();
    final gait = ((input[1] + input[2] + input[3] + input[4] + input[5]) / 5 * 3).clamp(0.0, 1.0).toDouble();
    final score = 0.4 * input[0] + 0.4 * gait + 0.2 * input[6];
    final tier = score < 0.3 ? 'low' : (score < 0.55 ? 'med' : 'high');
    final edge = tier == 'low' ? 0.3 - score : (tier == 'med' ? min(score - 0.3, 0.55 - score) : score - 0.55);
    final conf = (60 + edge * 120).clamp(55.0, 97.0).toDouble();
    return RiskResult(tier, conf, score);
  }
}
