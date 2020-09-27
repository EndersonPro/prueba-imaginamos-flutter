import 'package:flutter/material.dart';

class StarAverage extends StatelessWidget {
  final double average;
  final double size;
  StarAverage({Key key, this.average, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _starAverage(average: average, size: size);
  }
}

Row _starAverage({@required double average, @required double size}) {
  if (average > 10) throw Exception();
  final int totalStar = average ~/ 2;
  List<Icon> listStar = new List();

  var i = 0;
  for (; i < 5; i++) {
    listStar.add(Icon(
      Icons.star,
      size: size,
      color: Colors.yellowAccent.withOpacity(i < totalStar - 1 ? .8 : .2),
    ));
  }
  return Row(children: listStar);
}
