import 'dart:async';
import 'package:filmsapp/models/film_detail_model.dart';
import 'package:filmsapp/models/film_model.dart';
import 'package:filmsapp/models/film_search_result_model.dart';
import 'package:filmsapp/services/films_service.dart';

class FilmsBloc {
  final FilmsService _filmsService = new FilmsService();

  final _popularStream = StreamController<List<Film>>.broadcast();
  final _ratedStream = StreamController<List<Film>>.broadcast();
  final _detailfilmStream = StreamController<FilmDetail>.broadcast();
  final _searchFilmStream = StreamController<List<Film>>.broadcast();
  final _isSearchingFilmStream = StreamController<bool>.broadcast();

  Function(List<Film>) get popularSink => _popularStream.sink.add;
  Function(List<Film>) get ratedSink => _ratedStream.sink.add;
  Function(FilmDetail) get filmDetailSink => _detailfilmStream.sink.add;
  Function(List<Film>) get searchFilmSink => _searchFilmStream.sink.add;
  Function(bool) get isSearchingFilmSink => _isSearchingFilmStream.sink.add;

  Stream<List<Film>> get popularStream => _popularStream.stream;
  Stream<List<Film>> get ratedStream => _ratedStream.stream;
  Stream<FilmDetail> get filmDetailStream => _detailfilmStream.stream;
  Stream<List<Film>> get searchFilmStream => _searchFilmStream.stream;
  Stream<bool> get isSearchingFilmStream => _isSearchingFilmStream.stream;

  Future getPopular() async {
    final List<Film> listPopular = await _filmsService.getPopular();
    popularSink(listPopular);
  }

  Future getRated() async {
    final List<Film> listRated = await _filmsService.getRated();
    ratedSink(listRated);
  }

  Future getDetail(String id) async {
    final FilmDetail filmDetail = await _filmsService.getFilmDetail(id);
    filmDetailSink(filmDetail);
  }

  Future searchFilm(String query) async {
    final List<Film> result = await _filmsService.buscarPelicula(query);
    searchFilmSink(result);
  }

  void disposeStreams() {
    _popularStream?.close();
    _ratedStream?.close();
    _detailfilmStream?.close();
    _searchFilmStream?.close();
    _isSearchingFilmStream?.close();
  }
}
