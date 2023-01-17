import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/moviePage.dart';

import '../Models/movie.dart';
import '../blocs/WatchList/watch_list_bloc.dart';

class PosterCard extends StatefulWidget {
  PosterCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  State<PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<PosterCard> {
  bool isWatchList = false;


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
                    return MoviePage(
                      movie: widget.movie,
                    );
                  },
                )),
            Positioned(
              right: 0,
              bottom: 0,
              child: BlocBuilder<WatchListBloc, WatchListState>(
                  builder: (context, state) {
                if (state is WatchListInitial) {
                  return Text("Loading");
                }
                if (state is WatchListLoaded) {
                  
                  if (state.watchList.movies.contains(widget.movie)) {
                    isWatchList = true;
                  }else{
                    isWatchList=false;
                  }
                  return IconButton(
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
                    icon: Icon(Icons.bookmark_rounded),
                    splashRadius: 5,
                    color: isWatchList ? Color(0xFFF37515) : Color(0xFF1D2024),
                  );
                } else {
                  return IconButton(
                    onPressed: () {
                      final snackBar =
                          SnackBar(content: Text('Sorry there is an error'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(Icons.bookmark_rounded),
                    color: Color(0xFF1D2024),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
