import 'package:filmsapp/screen/detail_film.dart';
import 'package:filmsapp/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.homeScreen:
        // return MaterialPageRoute(builder: (_) => DetailFilm());
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case DetailFilm.detailFilmScreen:
        return MaterialPageRoute(
            builder: (_) => DetailFilm(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No hay ruta definida para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
