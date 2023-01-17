import 'dart:convert';

import 'package:movie_app/Models/movie.dart';
import 'package:movie_app/api/apiConstants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  Future<List<Movie>?> getMovies(String moviesEndpoint) async {
    var url = Uri.parse(ApiConstants.baseUrl + moviesEndpoint);
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
