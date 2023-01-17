import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movie_web_app/features/movies/pages/movie_page.dart';
import 'package:movie_web_app/models/movie.dart';

class FirstPosterCard extends StatefulWidget {
  const FirstPosterCard(
      {Key? key, required this.movie, this.isWatchList = false})
      : super(key: key);
  final Movie movie;
  final bool isWatchList;
  @override
  State<FirstPosterCard> createState() => _FirstPosterCardState();
}

class _FirstPosterCardState extends State<FirstPosterCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            child: Stack(alignment: Alignment.bottomLeft, children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                widget.movie.posterPath,
                fit: BoxFit.fill,
                width: screenWidth / 2,
              )),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.movie.title,
                    style: theme.textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${widget.movie.genre[0]}...",
                      style: theme.textTheme.subtitle2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Year :${widget.movie.releaseDate.year}  Duration : ${widget.movie.runTime}",
                      style: theme.textTheme.subtitle2),
                ),
              ]),
          Positioned(
              right: 10,
              bottom: 5,
              child: OpenContainer(
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                closedBuilder: (BuildContext context, void Function() action) {
                  return Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D2024).withOpacity(0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "More Info",
                        style: theme.textTheme.subtitle2,
                      ),
                    ),
                  );
                },
                openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) {
                  return MoviePage(movie: widget.movie);
                },
              ))
        ])));
  }
}
