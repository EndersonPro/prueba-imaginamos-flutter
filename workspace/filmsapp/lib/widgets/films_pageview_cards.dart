import 'package:filmsapp/models/film_model.dart';
import 'package:flutter/material.dart';

class FilmsPageViewCard extends StatelessWidget {
  final List<Film> films;
  final _pageController =
      PageController(initialPage: 1, viewportFraction: 0.32);

  FilmsPageViewCard({@required this.films});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        // siguientePagina();
      }
    });

    return Container(
      height: height * 0.25,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: films.length,
        itemBuilder: (BuildContext context, int i) => _card(context, films[i]),
      ),
    );
  }

  Widget _card(BuildContext context, Film film) {
    // film.uniqueId = '${film.id}-poster';
    final tarjeta = Container(
      // margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'test',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(film.getPoster()),
                placeholder: AssetImage('assets/images/no-poster.jpg'),
                fit: BoxFit.cover,
                height: 140.0,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            film.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white60, fontSize: 12),
          )
        ],
      ),
    );
    return tarjeta;
  }
}
