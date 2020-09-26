import 'package:filmsapp/widget/header_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static final String homePage = '/';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Aca por si acaso

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(0xFF5aa0d4),
        child: Column(
          children: [
            Container(
              height: height * 0.35,
              width: width,
              padding: EdgeInsets.only(
                left: width * 0.10,
                right: width * 0.10,
                top: 60,
              ),
              color: Color(0xFF5aa0d4),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Hello, what do you want to watch ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              color: Colors.white.withOpacity(.2),
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(.5),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(.5),
                              ),
                              hintText: 'Search',
                              fillColor: Colors.white.withOpacity(.2),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.65,
              width: width,
              decoration: BoxDecoration(
                color: Color(0xFF283546),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 35, left: 25, right: 25, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RECOMMENDED FOR YOU',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.6),
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.3),
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
    paint.strokeWidth = 5;

    path.lineTo(0, size.height * 1.1);
    // path.lineTo(size.width * .04, size.height);
    path.quadraticBezierTo(size.width * 0.04 / 1.8, size.height * 1.0025,
        size.width * .04, size.height);
    // path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
