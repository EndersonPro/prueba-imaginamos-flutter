import 'package:filmsapp/bloc/films_bloc.dart';
import 'package:filmsapp/bloc/main_bloc.dart';
import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/screen/search_screen.dart';
import 'package:filmsapp/widgets/films_pageview_cards.dart';
import 'package:filmsapp/widgets/search_input.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const String homeScreen = '/';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final FilmsBloc filmsBloc = MainBloc.of(context).filmsBloc;

    filmsBloc.getPopular();
    filmsBloc.getRated();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: Theme.of(context).accentColor,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * .2,
                  padding: EdgeInsets.only(
                    left: width * 0.10,
                    right: width * 0.10,
                    top: height * .03,
                  ),
                  margin: EdgeInsets.only(bottom: height * .05),
                  color: Theme.of(context).accentColor,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Hello, what do you want to watch ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height * .03,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        SearchInput(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          readOnly: true,
                          onTap: () {
                            Navigator.pushNamed(
                                context, SearchScreen.searchScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * .03,
                            left: width * .06,
                            right: width * .06,
                            bottom: height * .02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'RECOMMENDED FOR YOU',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.6),
                                  fontSize: 13.0,
                                ),
                              ),
                              Text(
                                'See all',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.3),
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _filmsCarrusel(stream: filmsBloc.popularStream),
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * .06,
                            right: width * .06,
                            bottom: height * .02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOP RATED',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.6),
                                  fontSize: 13.0,
                                ),
                              ),
                              Text(
                                'See all',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.3),
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _filmsCarrusel(stream: filmsBloc.ratedStream)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _filmsCarrusel({Stream<List<Film>> stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          return FilmsPageViewCard(
            films: snapshot.data,
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
