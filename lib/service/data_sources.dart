import 'package:http/http.dart';
import 'package:movie_web_app/models/chosen_filters.dart';
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

  Future<List<Movie>?> searchMovies(String keyword) async {
    var url = Uri.parse(Urls.baseUrl + Urls.searchMovies + keyword);
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

  static Future<bool> login(String userName, String password) async {
    Map<String, String> body = {'email': userName, 'password': password};
    var url = Uri.parse(Urls.login);
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Server error');
    }
  }

  static Future<bool> signUp(String userName, String password) async {
    Map<String, String> body = {
      'username': userName,
      'email': userName,
      'password': password
    };
    var url = Uri.parse(Urls.signUp);
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 409) {
      return false;
    } else {
      throw Exception('Server error');
    }
  }

  static Future<String> askChatGPT(ChosenFilters chosenFilters) async {
    Map<String, dynamic> params = {
      'AgeRestriction': chosenFilters.isAgeApproriate == true
          ? 'less than 18 years old'
          : 'more than 18 years old',
      'Genre': chosenFilters.genres ?? 'any genres',
      'country': chosenFilters.languages ?? 'french',
      'duration': chosenFilters.duration ?? 'more than 1 hour'
    };
    var url = Uri.http(Urls.localhost, Urls.chatGPT, params);
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
    });

    if (response.statusCode == 200) {
      String recommandation = response.body;
      return recommandation;
    } else {
      return 'ChatGPT server is down';
    }
  }
}
