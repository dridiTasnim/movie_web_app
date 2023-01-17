import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/Models/movie.dart';
import 'package:movie_app/Models/watchList.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  WatchListBloc() : super(WatchListInitial()){
    on<WatchListStarted>( _mapWatchListStartedToState);
    on<WatchListAdded>( _mapWatchListAddedToState);
    on<WatchListDeleted>( _mapWatchListDeletedToState);
  }

  Future<void> _mapWatchListStartedToState(WatchListStarted event, Emitter<WatchListState> emit) async {
    emit(WatchListInitial());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit( WatchListLoaded());
    } catch (_) {
      emit(WatchListError());
    }
  }

  Future<void> _mapWatchListAddedToState(
    WatchListAdded event,
    Emitter<WatchListState> emit,
  ) async {
    final state = this.state;
    if (state is WatchListLoaded) {
      try {
        emit(WatchListLoaded(watchList: WatchList(
        movies: [...state.watchList.movies,event.movie]))
      );} catch (_) {
        emit(WatchListError());
      }
    }
  }

  void _mapWatchListDeletedToState(WatchListDeleted event, Emitter<WatchListState> emit) {
    final state = this.state;
    if (state is WatchListLoaded) {
      try {
        emit( WatchListLoaded(watchList: WatchList(
        movies: [...state.watchList.movies]..remove(event.movie))
      ));
      } catch (_) {
        emit(WatchListError());
      }
    }
  }
}

 