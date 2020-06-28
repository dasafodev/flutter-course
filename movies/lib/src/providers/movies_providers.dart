import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movies/src/models/actor_model.dart';
import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey = '6e4a2bb182d7e18395320dbee282eb3d';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularPage = 0;

  bool _loading = false;

  List<Movie> _popularList = new List();

  final _popularStream = new StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStream.sink.add;

  Stream<List<Movie>> get popularStream => _popularStream.stream;

  void disposeStreams() {
    _popularStream?.close();
  }

  Future<List<Movie>> _processMovie(Uri url) async {
    final result = await http.get(url);
    final decodedData = json.decode(result.body);
    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.list;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    return await _processMovie(url);
  }

  Future<List<Movie>> getPopular() async {
    if (_loading) return [];
    _loading = true;
    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularPage.toString(),
    });

    final resp = await _processMovie(url);
    _popularList.addAll(resp);
    popularSink(_popularList);
    _loading = false;
    return resp;
  }

  Future<List<Actor>> getCast(int movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJSONList(decodedData['cast']);

    return cast.actors;

  }

   Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key' : _apiKey,
      'language': _language,
      'query'   : query
    });

    return await _processMovie(url);
  }
}
