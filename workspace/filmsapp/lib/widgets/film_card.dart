import 'package:filmsapp/models/film_model.dart';
import 'package:flutter/material.dart';
import 'package:filmsapp/screen/detail_film.dart';
import 'package:filmsapp/screen/arguments/detail_film_arg.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  const FilmCard({Key key, this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailFilm.detailFilmScreen,
          arguments: DetailScreenArguments(film),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(film.getPoster()),
                placeholder: AssetImage('assets/images/no-poster.jpg'),
                fit: BoxFit.cover,
                height: 140.0,
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
      ),
    );
  }
}
