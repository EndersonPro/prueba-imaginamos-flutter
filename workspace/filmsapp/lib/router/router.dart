import 'package:filmsapp/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    const String homePage = '/';
    const String feed = '/feed';

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case feed:
      // return MaterialPageRoute(builder: (_) => Feed());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
