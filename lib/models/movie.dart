class Movie {
  int movieId;
  double rate;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String country;
  String originalTitle;
  List<String> genre;
  String backdropPath;
  bool adult;
  String overview;
  DateTime releaseDate;
  int runTime;

  Movie(
      this.movieId,
      this.rate,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.country,
      this.originalTitle,
      this.genre,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate,
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
