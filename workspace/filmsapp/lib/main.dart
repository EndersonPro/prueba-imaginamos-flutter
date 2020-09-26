import 'package:flutter/material.dart';
import 'package:filmsapp/router/router.dart';
import 'package:filmsapp/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      onGenerateRoute: RouterApp.generateRoute,
      initialRoute: HomeScreen.homePage,
    );
  }
}
