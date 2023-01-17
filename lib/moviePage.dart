import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Models/movie.dart';

import 'blocs/WatchList/watch_list_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool isWatchList = false;
  
  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1D2024),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 450,
              color: Colors.transparent,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                    bottom: 100,
                    top: 0,
                    child: SizedBox(
                      width: screenWidth,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        child: Image.network(
                          widget.movie.backdrop_path,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    height: 300,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: Image.network(
                        widget.movie.poster_path,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 250,
                      bottom: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.movie.title,
                            style: theme.textTheme.headline1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Original title : " + widget.movie.original_title,
                              style: theme.textTheme.subtitle1),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Release Date : " +
                                  widget.movie.release_date.year.toString(),
                              style: theme.textTheme.subtitle2),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Popularity : " +
                                  widget.movie.popularity.toString(),
                              style: theme.textTheme.subtitle2),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFF37515),
                              ),
                              Text(
                                widget.movie.rate.toString(),
                                style: TextStyle(color: Color(0xFFF37515)),
                              )
                            ],
                          )
                        ],
                      )),
                  BlocBuilder<WatchListBloc, WatchListState>(
                    builder: (context, state) {
                      if (state is WatchListInitial) {
                        return Text(
                            "Loading");
                      }
                      if (state is WatchListLoaded) {
                        if (state.watchList.movies.contains(widget.movie)) {
                            isWatchList = true;
                        }
                        return Positioned(
                          left: 250,
                          bottom: 30,
                          child: TextButton(
                            onPressed: () {
                              if (!isWatchList) {
                                context
                                    .read<WatchListBloc>()
                                    .add(WatchListAdded(widget.movie));
                                setState(() {
                                  isWatchList = true;
                                });
                              }else{
                                context
                                    .read<WatchListBloc>()
                                    .add(WatchListDeleted(widget.movie));
                                print(state.watchList.movies.indexOf(widget.movie));
                                setState(() {
                                  isWatchList = false;
                                });
                              }
                            },
                            child: Text(
                              isWatchList ? "Added click to remove" : "My List +",
                              style: theme.textTheme.button,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:  isWatchList ? Color.fromARGB(255, 69, 168, 12) : Color(0xFFF37515)
                            ),
                          ),
                        );
                      } else {
                        return TextButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                                content: Text('Sorry there is an error'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Text(
                            "My List +",
                            style: theme.textTheme.button,
                          ),
                        );
                      }
                    },
                  ),

                  
                ],
              ),
            ),
          ),
          
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
              sliver: SliverToBoxAdapter(
                  child: Text(
                "OverView",
                style: theme.textTheme.headline1,
              ))),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  widget.movie.overview,
                  style: theme.textTheme.bodyText1,
                )),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
              sliver: SliverToBoxAdapter(
                  child: Text(
                "Details",
                style: theme.textTheme.headline1,
              ))),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(right: 60, left: 60, bottom: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Genres",
                        style: theme.textTheme.bodyText1,
                      ),
                      Row(
                        children: [
                          for (var genre in widget.movie.genre)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFF37515).withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    genre,
                                    style: theme.textTheme.bodyText1,
                                  ),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Country of origin",
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        widget.movie.country,
                        style: theme.textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Runtime",
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        widget.movie.runTime.toString() + " Min",
                        style: theme.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
