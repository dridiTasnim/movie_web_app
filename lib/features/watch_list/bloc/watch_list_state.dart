part of 'watch_list_bloc.dart';

@immutable
abstract class WatchListState extends Equatable {
  const WatchListState();
}

class WatchListInitial extends WatchListState {
  @override
  List<Object> get props => [];
}

class WatchListLoaded extends WatchListState {
  final WatchList watchList;
  const WatchListLoaded({this.watchList = const WatchList()});

  @override
  List<Object> get props => [watchList];
}

class WatchListError extends WatchListState {
  @override
  List<Object> get props => [];
}
