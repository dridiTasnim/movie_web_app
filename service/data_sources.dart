import 'package:movie_web_app/models/movie.dart';

import 'urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSources {
  Future<List<Movie>?> getMovies() async {
    var url = Uri.parse(Urls.movies);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<Movie> movies = List<Movie>.from(
          jsonDecode(response.body).map((k) => Movie.fromJson(k)));
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
