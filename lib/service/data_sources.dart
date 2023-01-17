import 'package:movie_web_app/models/movie.dart';

import 'urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSources {
  Future<List<Movie>?> getMovies() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=89544fa5b5a4e780a17fb40324900182&language=en-US&page=1");
    //var url = Uri.parse(Urls.movies);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      
      List<Movie> movies= List<Movie>.from(parsed.map<Movie>((json) => Movie.fromJson(json)));
      
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
