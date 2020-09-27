import 'dart:async';

import 'package:filmsapp/bloc/films_bloc.dart';
import 'package:filmsapp/bloc/main_bloc.dart';
import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/models/film_search_result_model.dart';
import 'package:filmsapp/screen/arguments/detail_film_arg.dart';
import 'package:filmsapp/screen/detail_film_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String searchScreen = '/search';

  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchQuery = TextEditingController();

  Timer debounceTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FilmsBloc filmsBloc = MainBloc.of(context).filmsBloc;

    _searchQuery.addListener(() {
      if (debounceTimer != null) {
        debounceTimer.cancel();
      }
      debounceTimer = Timer(Duration(milliseconds: 500), () {
        if (this.mounted && _searchQuery.text.isNotEmpty) {
          filmsBloc.isSearchingFilmSink(true);
          filmsBloc.searchFilm(_searchQuery.text);
        }
      });
    });
    return Scaffold(
      body: Container(
        color: Color(0xFF283546),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              height: 35,
              child: TextField(
                autofocus: true,
                controller: _searchQuery,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(.5),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                  hintText: 'Search',
                  fillColor: Colors.white.withOpacity(.2),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: filmsBloc.searchFilmStream,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
                  if (snapshot.hasData) {
                    final List<Film> films = snapshot.data;
                    filmsBloc.isSearchingFilmSink(false);
                    print(films[0]);
                    return ListView.builder(
                      itemCount: films.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DetailFilm.detailFilmScreen,
                              arguments: DetailScreenArguments(films[index]),
                            );
                          },
                          child: ListTile(
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          films[index].getPoster()),
                                      placeholder: AssetImage(
                                          'assets/images/no-poster.jpg'),
                                    ),
                                  ),
                                  Container(
                                    width: 220,
                                    height: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          films[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.8),
                                              fontSize: 13.0,
                                              fontFamily: 'OpenSans'),
                                        ),
                                        Text(
                                          films[index].originalTitle,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(.8),
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
