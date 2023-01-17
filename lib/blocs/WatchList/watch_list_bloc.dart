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

 /*@override
    Stream<WatchListState> mapEventToState (
      WatchListEvent event
    ) async* {
      if( event is WatchListStarted){
        yield* _mapWatchListStartedToState();
      } else if (event is WatchListAdded){
        yield* _mapWatchListAddedToState(event,state);
      } else if (event is WatchListDeleted){
        yield* _mapWatchListDeletedToState(event,state);
      }
    }
  Stream<WatchListState> _mapWatchListStartedToState() async*{
    yield WatchListInitial();
    try{
      await Future<void>.delayed(Duration(seconds: 1));
      yield WatchListLoaded();
    }catch(_){}
  }

  Stream<WatchListState> _mapWatchListAddedToState(
    WatchListAdded event,
    WatchListState state,
  ) async*{
    if(state is WatchListLoaded)
    try{
      yield WatchListLoaded(watchList: WatchList(
        movies: List.from(state.watchList.movies..add(event.movie))
      ));
    }catch(_){}
  }

  Stream<WatchListState> _mapWatchListDeletedToState(
    WatchListDeleted event,
    WatchListState state,
  ) async*{
    if(state is WatchListLoaded)
    try{
      yield WatchListLoaded(watchList: WatchList(
        movies: List.from(state.watchList.movies..remove(event.movie))
      ));
    }catch(_){}
  }*/
//}
/*

    @override
    Stream<WatchListState> mapEventToState (
      WatchListEvent event
    ) async* {
      if( event is WatchListStarted){
        emit( _mapWatchListStartedToState());
      } else if (event is WatchListAdded){
        emit( _mapWatchListAddedToState(event,state));
      } else if (event is WatchListDeleted){
        emit( _mapWatchListDeletedToState(event,state));
      }
    }
*/ 
/*
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final ShoppingRepository shoppingRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await shoppingRepository.loadCartItems();
      emit(CartLoaded(cart: Cart(items: [...items])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addItemToCart(event.item);
        emit(CartLoaded(cart: Cart(items: [...state.cart.items, event.item])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeItemFromCart(event.item);
        emit(
          CartLoaded(
            cart: Cart(
              items: [...state.cart.items]..remove(event.item),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}*/