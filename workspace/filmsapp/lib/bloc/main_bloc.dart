import 'package:filmsapp/bloc/films_bloc.dart';
import 'package:flutter/material.dart';

class MainBloc extends InheritedWidget {
  final filmsBloc = FilmsBloc();

  MainBloc({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static FilmsBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainBloc>().filmsBloc;
  }
}
