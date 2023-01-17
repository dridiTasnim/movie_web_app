import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:movie_app/Models/movie.dart';

class WatchList extends Equatable{
  final List<Movie> movies;
  const WatchList({this.movies = const <Movie>[]});

  @override
  List<Object?> get props => [movies];

}