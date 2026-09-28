import 'patient.dart';
import 'symptoms.dart';

class Screening {
  final int patientId;
  final String answers;
  final int symptomScore;
  final double flexion, cadence, symmetry, smoothness, consistency;
  final String tier;
  final double confidence;
  final String advice; // advice token: rec_low / rec_med / rec_high
  final String createdAt;
  const Screening({
    required this.patientId, required this.answers, required this.symptomScore,
    required this.flexion, required this.cadence, required this.symmetry,
    required this.smoothness, required this.consistency, required this.tier,
    required this.confidence, required this.advice, required this.createdAt,
  });
  Map<String, Object?> toMap() => {
        'patient_id': patientId, 'answers': answers, 'symptom_score': symptomScore,
        'flexion': flexion, 'cadence': cadence, 'symmetry': symmetry, 'smoothness': smoothness,
        'consistency': consistency, 'tier': tier, 'confidence': confidence,
        'advice': advice, 'created_at': createdAt,
      };
}

/// In-memory state carried across the screening flow.
class Session {
  static Patient? patient;
  static Symptoms? symptoms;
}
