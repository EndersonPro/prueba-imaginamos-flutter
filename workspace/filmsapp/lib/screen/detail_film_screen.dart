import 'package:filmsapp/bloc/actor_bloc.dart';
import 'package:filmsapp/bloc/films_bloc.dart';
import 'package:filmsapp/bloc/main_bloc.dart';
import 'package:filmsapp/models/actor_model.dart';
import 'package:filmsapp/models/film_detail_model.dart';
import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/widgets/actors_pageview_card.dart';
import 'package:filmsapp/widgets/star_average.dart';
import 'package:flutter/material.dart';
import 'arguments/detail_film_arg.dart';

class DetailFilm extends StatelessWidget {
  static const String detailFilmScreen = '/detail-film';

  const DetailFilm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    final Film film = args.film;
    final ActorBloc actorBloc = MainBloc.of(context).actorsBloc;
    final FilmsBloc filmsBloc = MainBloc.of(context).filmsBloc;
    final String idFilm = film.id.toString();
    actorBloc.getActors(idFilm);
    filmsBloc.getDetail(idFilm);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF283546),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: StreamBuilder(
                      stream: filmsBloc.filmDetailStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<FilmDetail> snapshot) {
                        if (snapshot.hasData) {
                          return FadeInImage(
                            image: NetworkImage(snapshot.data.getBackground()),
                            fit: BoxFit.cover,
                            placeholder:
                                AssetImage('assets/images/loader-poster.gif'),
                          );
                        }
                        return Image(
                          image: AssetImage('assets/images/loader-poster.gif'),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 20),
                    width: size.width,
                    height: 50,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.white.withOpacity(.7)),
                          onPressed: () => {Navigator.pop(context)},
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border,
                              color: Colors.white.withOpacity(.7)),
                          onPressed: () => {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.7,
                        child: Text(
                          film.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 23.0,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      ImageIcon(
                        AssetImage('assets/images/icons/quality.png'),
                        color: Colors.white.withOpacity(.2),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * .04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              color: Colors.white.withOpacity(.2),
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            color: Colors.white.withOpacity(.2),
                            onPressed: () => {},
                            child: Text(
                              'WATCH NOW',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.4)),
                            ),
                          ),
                        ),
                      ),
                      StarAverage(
                        average: film.voteAverage,
                        size: 20,
                      )
                    ],
                  ),
                  SizedBox(height: size.height * .04),
                  Text(
                    film.overview,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    style: TextStyle(
                        color: Colors.white.withOpacity(.4),
                        fontSize: size.height * .02,
                        height: 1.5),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF283546),
              ),
            ),
            Expanded(
              child: Container(
                child: StreamBuilder(
                  stream: actorBloc.actors,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Actor>> snapshot) {
                    if (snapshot.hasData) {
                      List<Actor> actors = snapshot.data;
                      return ActorsPageView(actors: actors);
                    }
                    return Container();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Genre',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: size.height * .02,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StreamBuilder(
                          stream: filmsBloc.filmDetailStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<FilmDetail> snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data;
                              List<Widget> listGenre = data.genres
                                  .asMap()
                                  .entries
                                  .map((MapEntry<int, Genre> entry) {
                                Genre genre = entry.value;
                                if (data.genres.length - 1 == entry.key)
                                  return Text(
                                    genre.name,
                                    style: TextStyle(
                                      fontSize: size.height * .02,
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                  );
                                return Text(
                                  '${genre.name}, ',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.2),
                                    fontSize: size.height * .02,
                                  ),
                                );
                              }).toList();
                              return Row(children: listGenre);
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Release',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'OpenSans',
                            fontSize: size.height * .02,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StreamBuilder(
                          stream: filmsBloc.filmDetailStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<FilmDetail> snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data;
                              DateTime time =
                                  DateTime.parse(data.releaseDate.toString());
                              return Text(
                                time.year.toString(),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.2),
                                  fontSize: size.height * .02,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'OpenSans',
                            fontSize: size.height * .02,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StreamBuilder(
                          stream: filmsBloc.filmDetailStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<FilmDetail> snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data;
                              return Text(
                                data.originalLanguage,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.2),
                                  fontSize: size.height * .02,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
