import 'package:flutter/material.dart';

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Colors.lightGreen;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    path.lineTo(0, size.height * .32);
    path.quadraticBezierTo(
        size.width * .5, size.height * .5, size.width, size.height * .32);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
