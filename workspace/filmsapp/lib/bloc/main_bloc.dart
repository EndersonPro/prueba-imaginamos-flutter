import 'package:filmsapp/bloc/actor_bloc.dart';
import 'package:filmsapp/bloc/films_bloc.dart';
import 'package:flutter/material.dart';

class _MainBloc {
  FilmsBloc _filmsBloc;
  ActorBloc _actorBloc;

  _MainBloc() {
    _filmsBloc = new FilmsBloc();
    _actorBloc = new ActorBloc();
  }

  FilmsBloc get filmsBloc => _filmsBloc;
  ActorBloc get actorsBloc => _actorBloc;
}

class MainBloc extends InheritedWidget {
  final mainBloc = _MainBloc();

  MainBloc({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static _MainBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainBloc>().mainBloc;
  }
}
