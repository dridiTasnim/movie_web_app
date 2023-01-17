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
    Movie movie = Movie(
        88,
        5.2,
        "aymen sellaouti",
        0.8,
        "https://cdn.shopify.com/s/files/1/0747/3829/products/mHP0217_1024x1024.jpeg?v=1571444284",
        "en",
        "Spain",
        "Jaws",
        ["Horror", "Drama", "Adventure"],
        "https://cdn.mos.cms.futurecdn.net/QfpYiWt35GZfU2Gd7pztQ8.png",
        true,
        "An insatiable great white shark terrorizes the townspeople of Amity Island, The police chief, an oceanographer and a grizzled shark hunter seek to destroy the bloodthirsty beast",
        DateTime(1975, 06, 18),
        120);
    return HomePage(); //MoviePage(movie: movie,);
  }
}
