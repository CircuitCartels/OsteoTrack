import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() => runApp(const OsteoTrackApp());

class OsteoTrackApp extends StatelessWidget {
  const OsteoTrackApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'OsteoTrack',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D6E6E)),
          scaffoldBackgroundColor: const Color(0xFFF4F8F9),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(54), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), side: const BorderSide(color: Color(0xFF0D6E6E), width: 1.5), textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
          cardTheme: CardThemeData(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: BorderSide(color: Colors.grey.shade200))),
        ),
        home: const SplashScreen(),
      );
}
