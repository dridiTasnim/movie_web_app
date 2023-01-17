import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/moviePage.dart';

import '../Models/movie.dart';
import '../blocs/WatchList/watch_list_bloc.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ScrollController controller = ScrollController();
    final theme = Theme.of(context);
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
                      widget.movie.poster_path,
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
                          icon: Icon(Icons.bookmark_rounded),
                          splashRadius: 5,
                          color: Color(0xFFF37515) 
                          ),
                      IconButton(
                          onPressed: () {
                            context.read<WatchListBloc>().add(WatchListDeleted(widget.movie));
                          },
                          icon: Icon(Icons.delete),
                          splashRadius: 5,
                          color: Color(0xFFF37515) 
                          ),
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
