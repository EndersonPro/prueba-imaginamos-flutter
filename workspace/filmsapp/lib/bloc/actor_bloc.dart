import 'dart:async';
import 'package:filmsapp/models/actor_model.dart';
import 'package:filmsapp/services/films_service.dart';

class ActorBloc {
  final StreamController<List<Actor>> _actorStream =
      StreamController<List<Actor>>.broadcast();
  final _filmsService = new FilmsService();

  Function(List<Actor>) get actorsAdd => _actorStream.sink.add;
  Stream<List<Actor>> get actors => _actorStream.stream;

  Future<void> getActors(String idFilm) async {
    try {
      List<Actor> actors = await _filmsService.getCast(idFilm);
      actorsAdd(actors);
    } catch (error) {
      print(error);
    }
  }

  void dispose() {
    _actorStream?.close();
  }
}
