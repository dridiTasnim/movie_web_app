import 'package:flutter/material.dart';
import 'package:movie_web_app/models/movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_web_app/service/urls.dart';

class DataSources {
  Future<List<Movie>?> getMovies(String path) async {
    var url = Uri.parse(Urls.baseUrl + path);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body)['results'];
      List<Movie> movies =
          List<Movie>.from(parsed.map((json) => Movie.fromJson(json)));
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>?> searchMovies(String keyworkd) async {
    var url = Uri.parse(Urls.baseUrl + Urls.searchMovies + keyworkd);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body)['results'];
      List<Movie> movies =
          List<Movie>.from(parsed.map((json) => Movie.fromJson(json)));
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
