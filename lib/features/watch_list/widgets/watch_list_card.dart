import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_web_app/features/movies/pages/movie_page.dart';
import 'package:movie_web_app/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:movie_web_app/models/movie.dart';
import 'package:movie_web_app/shared/colors.dart';

class WatchListCard extends StatefulWidget {
  const WatchListCard({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  State<WatchListCard> createState() => _WatchListCardState();
}

class _WatchListCardState extends State<WatchListCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: OpenContainer(
                  closedColor: Colors.transparent,
                  openColor: Colors.transparent,
                  closedBuilder:
                      (BuildContext context, void Function() action) {
                    return Image.network(
                      widget.movie.posterPath,
                      fit: BoxFit.fill,
                      width: screenWidth / 3,
                    );
                  },
                  openBuilder: (BuildContext context,
                      void Function({Object? returnValue}) action) {
                    return MoviePage(movie: widget.movie);
                  },
                )),
            Positioned(
              right: 0,
              bottom: 0,
              child: BlocBuilder<WatchListBloc, WatchListState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_rounded),
                          splashRadius: 5,
                          color: AppColors.secondary),
                      IconButton(
                          onPressed: () {
                            context
                                .read<WatchListBloc>()
                                .add(WatchListDeleted(widget.movie));
                          },
                          icon: const Icon(Icons.delete),
                          splashRadius: 5,
                          color: AppColors.secondary)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
