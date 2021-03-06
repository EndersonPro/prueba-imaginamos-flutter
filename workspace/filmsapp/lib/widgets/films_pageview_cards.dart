import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/widgets/film_card.dart';
import 'package:flutter/material.dart';

class FilmsPageViewCard extends StatelessWidget {
  final List<Film> films;
  final _pageController =
      PageController(initialPage: 1, viewportFraction: 0.32);

  FilmsPageViewCard({@required this.films});

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {}
    });

    return Expanded(
      child: Container(
        child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          physics: PageScrollPhysics(),
          itemCount: films.length,
          itemBuilder: (BuildContext context, int i) =>
              FilmCard(film: films[i]),
        ),
      ),
    );
  }
}
