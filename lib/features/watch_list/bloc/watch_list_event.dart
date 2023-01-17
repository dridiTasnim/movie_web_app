part of 'watch_list_bloc.dart';

@immutable
abstract class WatchListEvent extends Equatable {
  const WatchListEvent();
}

//Will prepare the watchList so we can add movies to it
class WatchListStarted extends WatchListEvent {
  @override
  List<Object> get props => [];
}

//Will be triggered everytime the user adds to his watchList
class WatchListAdded extends WatchListEvent {
  final Movie movie;

  const WatchListAdded(this.movie);

  @override
  List<Object> get props => [movie];
}

//Will be triggered everytime the user deletes from his watchList
class WatchListDeleted extends WatchListEvent {
  final Movie movie;

  const WatchListDeleted(this.movie);

  @override
  List<Object> get props => [movie];
}
