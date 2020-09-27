import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/screen/detail_film_screen.dart';
import 'package:filmsapp/widgets/star_average.dart';
import 'package:flutter/material.dart';
import 'package:filmsapp/screen/arguments/detail_film_arg.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  const FilmCard({Key key, this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailFilm.detailFilmScreen,
          arguments: DetailScreenArguments(film),
        );
      },
      child: Container(
        height: size.height * .22,
        width: size.width * .30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(film.getPoster()),
                placeholder: AssetImage('assets/images/no-poster.jpg'),
                fit: BoxFit.cover,
                height: size.height * .22,
                width: size.width * .30,
              ),
            ),
            SizedBox(height: size.height * .002),
            Text(
              film.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white60, fontSize: 12),
            ),
            StarAverage(average: film.voteAverage, size: 12)
          ],
        ),
      ),
    );
  }
}
