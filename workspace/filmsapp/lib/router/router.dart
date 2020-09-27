import 'package:filmsapp/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:filmsapp/screen/detail_film_screen.dart';
import 'package:filmsapp/screen/home_screen.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.homeScreen:
        // return MaterialPageRoute(builder: (_) => DetailFilm());
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case DetailFilm.detailFilmScreen:
        return MaterialPageRoute(
            builder: (_) => DetailFilm(), settings: settings);
      case SearchScreen.searchScreen:
        return MaterialPageRoute(
            builder: (_) => SearchScreen(), settings: settings);
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
