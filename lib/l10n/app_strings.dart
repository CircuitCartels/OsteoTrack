import 'package:flutter/material.dart';

/// Central offline string matrix. Missing keys fall back to English.
class AppStrings {
  static final ValueNotifier<String> lang = ValueNotifier<String>('en');
  static const Map<String, String> names = {
    'en': 'English', 'hi': 'हिन्दी', 'as': 'অসমীয়া', 'bn': 'বাংলা',
    'mni': 'মৈতৈলোন', 'lus': 'Mizo', 'ne': 'नेपाली', 'brx': 'बड़ो',
    'trp': 'Kokborok', 'kha': 'Khasi', 'grt': 'Garo',
  };
  static String t(String k) => _d[lang.value]?[k] ?? _d['en']![k] ?? k;

  static const Map<String, Map<String, String>> _d = {
    'en': {
      'tab_reports': 'Reports', 'tab_about': 'About', 'demo': 'DEMO MODE',
      'hero': 'Early OA Risk Screening', 'start_new': 'Start New Screening', 'prev': 'Previous Reports',
      'info': 'OsteoTrack combines symptoms and gait patterns to provide a preliminary OA risk screening.',
      'steps': 'How it works', 's1': 'Setup', 's2': 'Walk', 's3': 'Classify', 's4': 'Report',
      'empty': 'No screenings saved yet', 'featcol': 'Feature', 'details': 'Details', 'close': 'Close',
      'about_t': 'About OsteoTrack', 'about_b': 'OsteoTrack is a low-cost wearable gait-sensor kit (two IMUs + ESP32) with an offline, multilingual app for early osteoarthritis risk screening by ASHA workers in the North Eastern Region. All processing happens on the device, with no internet needed. This build runs in demo mode with simulated sensor data.',
      'about_team': 'SIH 2026 • SIH26004 • Team Circuit Cartels', 'lang_note': 'Some languages fall back to English until reviewed translations are added.',
      'disc': 'Screening/Risk Assessment only — Not a medical diagnosis.',
      'home': 'Home', 'prevent': 'Prevention', 'name': 'Patient name', 'age': 'Age',
      'gender': 'Gender', 'male': 'Male', 'female': 'Female', 'other': 'Other',
      'q1': 'Knee joint pain', 'q2': 'Joint stiffness', 'q3': 'Difficulty walking on flat ground',
      'q4': 'Difficulty climbing stairs', 'q5': 'Visible knee swelling',
      'l0': 'None', 'l1': 'Mild', 'l2': 'Moderate', 'l3': 'Severe',
      'score': 'Symptom score (0-15)', 'calib': 'Belt Calibration', 'next': 'Continue to calibration',
      'mis': 'Misaligned — adjust the harness belt', 'ok': 'Centered / Level Zone',
      'start': 'Start 10MWT Test', 'walking': 'Walk 10 metres at a natural pace',
      'p_acc': 'Acceleration phase (0-2 m) — excluded', 'p_ss': 'Steady-state (2-8 m) — analysed',
      'p_dec': 'Deceleration phase (8-10 m) — excluded', 'time': 'Elapsed',
      'report': 'Screening Report', 'feat': 'Extracted Gait Features', 'measured': 'Measured',
      'ref': 'Healthy reference', 'f1': 'Knee flexion range', 'f2': 'Cadence (steps/min)',
      'f3': 'Left-right symmetry', 'f4': 'Angular velocity smoothness', 'f5': 'Peak flexion consistency',
      'low': 'LOW RISK', 'med': 'MEDIUM RISK', 'high': 'HIGH RISK', 'conf': 'Confidence',
      'top': 'Top Contributing Features', 'c1': 'Clinical History', 'c2': 'Gait Symmetry', 'c3': 'Demographics',
      'recs': 'Recommendations',
      'rec_low': 'Continue Straight Leg Raises (3x10 daily), stay active, and re-screen in 6 months.',
      'rec_med': 'Begin quadriceps strengthening and low-impact exercise, manage weight, and see a health worker within 1-2 months.',
      'rec_high': 'Consult an orthopaedic specialist soon. Use low-impact unloading and stabilisation (e.g. supportive knee sleeve, cane on the opposite side) and avoid heavy loads.',
      'saved': 'Saved offline', 'newtest': 'New screening',
      't_joint': 'Joint Care & Mechanics', 't_act': 'Physical Activity',
      't_nut': 'Nutrition & Cartilage Support', 't_life': 'Lifestyle & Ergonomics',
      'b_joint': 'Avoid prolonged squatting and kneeling. Sit on a raised seat, keep knees in line with toes, take short breaks on slopes, and carry loads close to the body.',
      'b_act': 'Aim for about 150 minutes a week of low-impact activity: walking on level ground, cycling, or swimming. Add slow quadriceps and hamstring strengthening. Stop if pain rises sharply.',
      'b_nut': 'Adults commonly target about 1000 mg calcium a day (dairy, greens, small fish). Drink 2-3 litres of water daily. Locally used options such as turmeric, ginger, leafy greens, fermented foods and black rice are often eaten for an anti-inflammatory diet.',
      'b_life': 'Track your weight monthly; even modest loss reduces knee load. For farm and porter work, use back-strap baskets with even weight, lift with bent hips, and alternate heavy and light tasks.',
    },
    'hi': {
      'tab_reports': 'रिपोर्ट', 'tab_about': 'परिचय', 'hero': 'घुटने के गठिया का शुरुआती जोखिम जांच',
      'start_new': 'नई जांच शुरू करें', 'prev': 'पिछली रिपोर्ट', 'empty': 'अभी कोई जांच सुरक्षित नहीं है',
      'disc': 'केवल स्क्रीनिंग/जोखिम आकलन — यह चिकित्सीय निदान नहीं है।',
      'home': 'जांच', 'prevent': 'रोकथाम', 'name': 'रोगी का नाम', 'age': 'आयु', 'gender': 'लिंग',
      'q1': 'घुटने में दर्द', 'q2': 'जोड़ों में जकड़न', 'q3': 'समतल जमीन पर चलने में कठिनाई',
      'q4': 'सीढ़ियां चढ़ने में कठिनाई', 'q5': 'घुटने में दिखने वाली सूजन',
      'l0': 'कोई नहीं', 'l1': 'हल्का', 'l2': 'मध्यम', 'l3': 'गंभीर', 'score': 'लक्षण स्कोर (0-15)',
      'calib': 'बेल्ट अंशांकन', 'next': 'अंशांकन पर जाएं', 'mis': 'असंरेखित — बेल्ट ठीक करें',
      'ok': 'केंद्रित / समतल क्षेत्र', 'start': '10MWT परीक्षण शुरू करें',
      'low': 'कम जोखिम', 'med': 'मध्यम जोखिम', 'high': 'उच्च जोखिम', 'conf': 'विश्वसनीयता',
      'report': 'स्क्रीनिंग रिपोर्ट', 'recs': 'सुझाव', 'top': 'प्रमुख योगदान कारक',
      't_joint': 'जोड़ों की देखभाल', 't_act': 'शारीरिक गतिविधि', 't_nut': 'पोषण', 't_life': 'जीवनशैली',
    },
    'as': {
      'disc': 'কেৱল স্ক্ৰীনিং/ঝুঁকি মূল্যায়ন — চিকিৎসা নিৰ্ণয় নহয়।',
      'home': 'পৰীক্ষা', 'prevent': 'প্ৰতিৰোধ', 'name': 'ৰোগীৰ নাম', 'age': 'বয়স',
      'q1': 'আঁঠুৰ বিষ', 'q2': 'গাঁঠি টান হোৱা', 'q3': 'সমতল ঠাইত খোজ কাঢ়িবলৈ অসুবিধা',
      'q4': 'জখলা বগাবলৈ অসুবিধা', 'q5': 'আঁঠু ফুলি থকা',
      'l0': 'নাই', 'l1': 'সামান্য', 'l2': 'মধ্যম', 'l3': 'গুৰুতৰ',
      'start': '10MWT পৰীক্ষা আৰম্ভ কৰক', 'low': 'কম ঝুঁকি', 'med': 'মধ্যম ঝুঁকি', 'high': 'বেছি ঝুঁকি',
      'report': 'স্ক্ৰীনিং প্ৰতিবেদন',
    },
    'bn': {
      'disc': 'শুধুমাত্র স্ক্রিনিং/ঝুঁকি মূল্যায়ন — চিকিৎসা নির্ণয় নয়।',
      'home': 'পরীক্ষা', 'prevent': 'প্রতিরোধ', 'name': 'রোগীর নাম', 'age': 'বয়স',
      'q1': 'হাঁটুতে ব্যথা', 'q2': 'জয়েন্ট শক্ত হওয়া', 'q3': 'সমতলে হাঁটতে অসুবিধা',
      'q4': 'সিঁড়ি ওঠায় অসুবিধা', 'q5': 'হাঁটু ফোলা',
      'l0': 'নেই', 'l1': 'হালকা', 'l2': 'মাঝারি', 'l3': 'গুরুতর',
      'start': '10MWT পরীক্ষা শুরু করুন', 'low': 'কম ঝুঁকি', 'med': 'মাঝারি ঝুঁকি', 'high': 'উচ্চ ঝুঁকি',
      'report': 'স্ক্রিনিং রিপোর্ট',
    },
    'ne': {
      'disc': 'स्क्रिनिङ/जोखिम मूल्याङ्कन मात्र — चिकित्सकीय निदान होइन।',
      'home': 'जाँच', 'prevent': 'रोकथाम', 'name': 'बिरामीको नाम', 'age': 'उमेर',
      'q1': 'घुँडा दुख्ने', 'q2': 'जोर्नी कडा हुने', 'q3': 'समथर भूमिमा हिँड्न कठिनाइ',
      'q4': 'भर्‍याङ चढ्न कठिनाइ', 'q5': 'घुँडा सुन्निने',
      'l0': 'छैन', 'l1': 'हल्का', 'l2': 'मध्यम', 'l3': 'गम्भीर',
      'start': '10MWT परीक्षण सुरु गर्नुहोस्', 'low': 'कम जोखिम', 'med': 'मध्यम जोखिम', 'high': 'उच्च जोखिम',
      'report': 'स्क्रिनिङ रिपोर्ट',
    },
    // Fill with reviewed native-speaker translations; English is used until then.
    'mni': {}, 'lus': {}, 'brx': {}, 'trp': {}, 'kha': {}, 'grt': {},
  };
}

/// Rebuilds its child whenever the language changes (works on pushed routes too).
class Lang extends StatelessWidget {
  final WidgetBuilder builder;
  const Lang({super.key, required this.builder});
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<String>(
      valueListenable: AppStrings.lang, builder: (c, _, __) => builder(c));
}

Widget langPicker() => Lang(
      builder: (c) => DropdownButton<String>(
        value: AppStrings.lang.value,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.language),
        items: AppStrings.names.entries
            .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
            .toList(),
        onChanged: (v) => AppStrings.lang.value = v ?? 'en',
      ),
    );

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});
  @override
  Widget build(BuildContext context) => Lang(
        builder: (c) => Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: const Color(0xFFFFF4E0), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFF0D6A8))),
          child: Row(children: [
            const Icon(Icons.info_outline, size: 18, color: Color(0xFF8A5A00)),
            const SizedBox(width: 8),
            Expanded(child: Text(AppStrings.t('disc'), style: const TextStyle(fontSize: 12.5, color: Color(0xFF7A4E00), fontWeight: FontWeight.w700))),
          ]),
        ),
      );
}
