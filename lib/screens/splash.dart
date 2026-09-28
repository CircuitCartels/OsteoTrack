import 'dart:async';
import 'package:flutter/material.dart';
import 'home_holder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2200), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeHolder()));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF0D6E6E),
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 900),
            builder: (c, v, child) => Opacity(opacity: v, child: child),
            child: Column(mainAxisSize: MainAxisSize.min, children: const [
              CircleAvatar(radius: 52, backgroundColor: Color(0x33FFFFFF), child: Icon(Icons.accessibility_new, size: 56, color: Colors.white)),
              SizedBox(height: 28),
              Text('OsteoTrack', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900)),
              SizedBox(height: 6),
              Text('Wearable Gait Screening', style: TextStyle(color: Colors.white70, fontSize: 18)),
              SizedBox(height: 40),
              SizedBox(width: 26, height: 26, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white70)),
            ]),
          ),
        ),
      );
}
