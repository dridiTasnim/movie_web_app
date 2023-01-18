import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_web_app/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:movie_web_app/models/filters.dart';
import 'package:movie_web_app/models/movie.dart';
import 'package:movie_web_app/shared/colors.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool isWatchList = false;
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
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
                          'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}',
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
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Original title : ${widget.movie.originalTitle}",
                              style: theme.textTheme.subtitle1),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Release Date : ${widget.movie.releaseDate}",
                              style: theme.textTheme.subtitle2),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Popularity : ${widget.movie.popularity}",
                              style: theme.textTheme.subtitle2),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: AppColors.secondary),
                              Text(
                                widget.movie.rate.toString(),
                                style:
                                    const TextStyle(color: AppColors.secondary),
                              )
                            ],
                          )
                        ],
                      )),
                  BlocBuilder<WatchListBloc, WatchListState>(
                    builder: (context, state) {
                      if (state is WatchListInitial) {
                        return const Text("Loading");
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
                              } else {
                                context
                                    .read<WatchListBloc>()
                                    .add(WatchListDeleted(widget.movie));

                                setState(() {
                                  isWatchList = false;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: isWatchList
                                    ? AppColors.green
                                    : AppColors.secondary),
                            child: Text(
                                isWatchList
                                    ? "Added! Click to remove"
                                    : "My List +",
                                style: theme.textTheme.button),
                          ),
                        );
                      } else {
                        return TextButton(
                          onPressed: () {
                            const snackBar = SnackBar(
                                content: Text('Sorry there is an error'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child:
                              Text("My List +", style: theme.textTheme.button),
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
                  child: Text("OverView", style: theme.textTheme.headline1))),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  widget.movie.overview,
                  style: theme.textTheme.bodyText1,
                )),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
              sliver: SliverToBoxAdapter(
                  child: Text("Details", style: theme.textTheme.headline1))),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 60, left: 60, bottom: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Genres", style: theme.textTheme.bodyText1),
                      Row(
                        children: [
                          for (var genre in widget.movie.genre_ids)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.secondary.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(genresNames[genre].toString(),
                                      style: theme.textTheme.bodyText1),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: AppColors.white.withOpacity(0.6),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Runtime",
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        "${widget.movie.runtime} Min",
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
