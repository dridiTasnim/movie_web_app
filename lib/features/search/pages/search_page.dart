import 'package:flutter/material.dart';
import 'package:movie_web_app/features/home_page/widgets/poster_card.dart';
import 'package:movie_web_app/models/movie.dart';
import 'package:movie_web_app/service/data_sources.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Movie> movies = [];
  late List<Movie>? searchedMovies;

  bool found = false;
  @override
  initState() {
    super.initState();
  }

  Future<List<Movie>?> getMovies(String key) async {
    return await DataSources().searchMovies(key);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D2024),
        elevation: 0,
        title: Text("Search For Your Movie", style: theme.textTheme.headline1),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Color(0xFF3A3F47),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: Color(0xFF242A32), blurRadius: 3)
                ]),
            child: TextField(
              onChanged: ((value) {
                getMovies(searchController.text).then((result) {
                  setState(() {
                    searchedMovies = result;
                    if (searchedMovies != null) {
                      movies = searchedMovies!;
                    }
                  });
                });
              }),
              controller: searchController,
              cursorColor: Colors.white,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF67686D),
                  ),
                  suffixIconColor: Color(0xFF67686D),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color(0xFF67686D),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400)),
            ),
          ),
          searchController.text.isEmpty
              ? SizedBox(
                  height: screenHeight / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You Can Search Anything...",
                        style: theme.textTheme.subtitle1,
                      ),
                      Icon(
                        Icons.movie_filter_outlined,
                        size: 100,
                        color: const Color(0xFFECECEC).withOpacity(0.1),
                      ),
                      Text(
                        "Movies, Series, Actors ...",
                        style: theme.textTheme.subtitle2,
                        overflow: TextOverflow.visible,
                      )
                    ],
                  ),
                )
              : (movies.isEmpty)
                  ? SizedBox(
                      height: screenHeight / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/no_results.png"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "we are sorry, we can \n not find the movie :(",
                                style: theme.textTheme.headline2),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      height: screenHeight * 0.8,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PosterCard(movie: movies[index]);
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
