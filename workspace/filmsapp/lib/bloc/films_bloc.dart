import 'dart:async';
import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/services/films_service.dart';

class FilmsBloc {
  final FilmsService _filmsService = new FilmsService();

  final _popularStream = StreamController<List<Film>>.broadcast();

  Function(List<Film>) get popularSink => _popularStream.sink.add;

  Stream<List<Film>> get popularStream => _popularStream.stream;

  Future getPopular() async {
    final List<Film> listPopular = await _filmsService.getPopular();
    popularSink(listPopular);
  }

  void disposeStreams() {
    _popularStream?.close();
  }
}
