class Movie {
  int movieId;
  num rate;
  String title;
  double popularity;
  String? posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genre_ids;
  String? backdropPath;
  bool adult;
  String overview;
  String releaseDate;
  int runtime;

  Movie(
      this.movieId,
      this.rate,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genre_ids,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.runtime);

  Movie.fromJson(Map<String, dynamic> json)
      : movieId = json['id'],
        rate = json['vote_average'],
        title = json['title'],
        popularity = json['popularity'],
        posterPath = json['poster_path'] ?? '',
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        genre_ids = json['genre_ids'].cast<int>(),
        backdropPath = json['backdrop_path'] ?? '',
        adult = json['adult'],
        overview = json['overview'],
        releaseDate = json['release_date'],
        runtime = json['runtime'] ?? 120;
}
