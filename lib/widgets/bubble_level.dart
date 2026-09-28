import 'package:flutter/material.dart';

class BubbleLevel extends StatelessWidget {
  final double angle; // -15..15
  const BubbleLevel({super.key, required this.angle});
  @override
  Widget build(BuildContext context) => CustomPaint(size: const Size(double.infinity, 110), painter: _P(angle));
}

class _P extends CustomPainter {
  final double angle;
  _P(this.angle);
  @override
  void paint(Canvas c, Size s) {
    final tube = RRect.fromRectAndRadius(Rect.fromLTWH(10, s.height / 2 - 30, s.width - 20, 60), const Radius.circular(30));
    c.drawRRect(tube, Paint()..color = Colors.white);
    c.drawRRect(tube, Paint()..color = Colors.teal..style = PaintingStyle.stroke..strokeWidth = 3);
    final cx = s.width / 2;
    final half = (s.width - 60) / 2;
    final zone = half * 3 / 15;
    c.drawRect(Rect.fromLTRB(cx - zone, s.height / 2 - 30, cx + zone, s.height / 2 + 30),
        Paint()..color = Colors.green.withOpacity(0.25));
    final line = Paint()..color = Colors.black54..strokeWidth = 2;
    c.drawLine(Offset(cx - zone, s.height / 2 - 30), Offset(cx - zone, s.height / 2 + 30), line);
    c.drawLine(Offset(cx + zone, s.height / 2 - 30), Offset(cx + zone, s.height / 2 + 30), line);
    final ok = angle.abs() <= 3;
    c.drawCircle(Offset(cx + half * angle / 15, s.height / 2), 20,
        Paint()..color = ok ? Colors.green : Colors.orange);
  }
  @override
  bool shouldRepaint(_P o) => o.angle != angle;
}
