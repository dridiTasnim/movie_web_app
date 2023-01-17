import 'package:flutter/material.dart';
import 'package:movie_app/blocs/WatchList/watch_list_bloc.dart';
import 'package:movie_app/homePage.dart';
import 'package:movie_app/moviePage.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/watchList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Models/movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> WatchListBloc()..add(WatchListStarted()))
      ],
      child: MaterialApp(
        title: 'Search & Chill',
        theme: Themedata().getTheme(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return HomePage(); 
  }
}
