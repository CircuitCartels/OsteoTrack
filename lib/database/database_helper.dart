import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/patient.dart';
import '../models/screening.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  DatabaseHelper._();
  Database? _db;

  Future<Database> get db async => _db ??= await openDatabase(
        join(await getDatabasesPath(), 'osteotrack.db'),
        version: 1,
        onCreate: (d, v) async {
          await d.execute('CREATE TABLE patients(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, gender TEXT)');
          await d.execute('CREATE TABLE screenings(id INTEGER PRIMARY KEY AUTOINCREMENT, patient_id INTEGER, answers TEXT, symptom_score INTEGER, flexion REAL, cadence REAL, symmetry REAL, smoothness REAL, consistency REAL, tier TEXT, confidence REAL, advice TEXT, created_at TEXT, FOREIGN KEY(patient_id) REFERENCES patients(id))');
        },
      );

  Future<int> saveScreening(Patient p, Screening Function(int patientId) build) async {
    final d = await db;
    final pid = await d.insert('patients', {'name': p.name, 'age': p.age, 'gender': p.gender});
    return d.insert('screenings', build(pid).toMap());
  }

  Future<List<Map<String, Object?>>> history() async {
    final d = await db;
    return d.rawQuery('SELECT s.*, p.name, p.age FROM screenings s JOIN patients p ON p.id = s.patient_id ORDER BY s.id DESC');
  }
}
