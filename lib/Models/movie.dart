import 'dart:convert';

class Movie {
  int movie_id;
  double rate;
  String title;
  double popularity;
  String poster_path;
  String original_language;
  String country;
  String original_title;
  List<String> genre;
  String backdrop_path;
  bool adult;
  String overview;
  DateTime release_date;
  int runTime;

  Movie(
      this.movie_id,
      this.rate,
      this.title,
      this.popularity,
      this.poster_path,
      this.original_language,
      this.country,
      this.original_title,
      this.genre,
      this.backdrop_path,
      this.adult,
      this.overview,
      this.release_date,
      this.runTime);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        json['movie_id'],
        json['rate'],
        json['title'],
        json['poster_path'],
        json['popularity'],
        json['original_language'],
        json['country'],
        json['original_title'],
        json['genre'],
        json['backdrop_path'],
        json['adult'],
        json['overview'],
        json['release_date'],
        json['runTime']);
  }
 

}
