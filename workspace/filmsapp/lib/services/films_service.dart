import 'dart:async';
import 'dart:convert';
import 'package:filmsapp/models/actor_model.dart';
import 'package:filmsapp/models/film_detail_model.dart';
import 'package:http/http.dart' as http;

import 'package:filmsapp/models/film_model.dart';

class FilmsService {
  String _url = 'api.themoviedb.org';
  String _apiKey = '094c1072b9fc88f52981b18a808f82aa';
  int _popularPage = 0;
  String _language = 'es-ES';
  bool _loading = false;
  List<Film> _popular = new List();

  Future<List<Film>> getPopular() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
    });
    final response = await _manageResponse(url);
    return response;
  }

  Future<List<Film>> getRated() async {
    final url = Uri.https(_url, '/3/movie/top_rated', {
      'api_key': _apiKey,
      'language': _language,
    });
    final response = await _manageResponse(url);
    return response;
  }

  Future<FilmDetail> getFilmDetail(String id) async {
    final url = Uri.https(_url, '/3/movie/$id', {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final filmDetail = new FilmDetail.fromJson(decodeData);
    print(filmDetail);
    return filmDetail;
  }

  Future<List<Film>> buscarPelicula(String query) async {
    List<Film> films = new List();
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    if (decodeData['results'] == null) return films;
    for (var item in decodeData['results']) {
      // print(item['release_date']);
      final film = new Film.fromJson(item);
      films.add(film);
    }
    return films;
  }

  Future<List<Actor>> getCast(String id) async {
    final uri = Uri.https(_url, '3/movie/$id/credits',
        {'api_key': _apiKey, 'language': _language});
    final resp = await http.get(uri);
    final decodeData = json.decode(resp.body);
    List<Actor> listActors = new List<Actor>();
    for (var item in decodeData['cast']) {
      final actor = new Actor.fromJson(item);
      listActors.add(actor);
    }
    return listActors;
  }

  Future<List<Film>> _manageResponse(Uri url) async {
    List<Film> films = new List();
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    if (decodeData['results'] == null) return films;
    for (var item in decodeData['results']) {
      final film = new Film.fromJson(item);
      films.add(film);
    }
    return films;
  }
}
