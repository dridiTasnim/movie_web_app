import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_web_app/features/home_page/dummy_data.dart';
import 'package:movie_web_app/features/home_page/widgets/first_post_card.dart';
import 'package:movie_web_app/features/home_page/widgets/poster_card.dart';
import 'package:movie_web_app/features/profile/profile_page.dart';
import 'package:movie_web_app/features/recommandation/recommandation_page.dart';
import 'package:movie_web_app/features/search/pages/search_page.dart';
import 'package:movie_web_app/features/sign_in_sign_up/login_sign_up_page.dart';
import 'package:movie_web_app/features/watch_list/pages/watch_list_page.dart';
import 'package:movie_web_app/models/contents.dart';
import 'package:movie_web_app/models/filters.dart';
import 'package:movie_web_app/models/movie.dart';
import 'package:movie_web_app/models/picked_filters.dart';
import 'package:movie_web_app/models/user_account.dart';
import 'package:movie_web_app/shared/colors.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:movie_web_app/service/data_sources.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  PickedFilters pickedFilters = PickedFilters();

  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine _matchEngine = MatchEngine();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late Future<List<Movie>?> movies1;
  int number = Random().nextInt(7);
  @override
  void initState() {
    super.initState();

    () async {
      movies = [movie1, movie2, movie3, movie5, movie6, movie7, movie8];
    }();
    List<String> names = [
      "Swipe To Read Some Facts About Our Movie Of The Day",
      movies[number].releaseDate,
     "+18 : "+movies[number].adult.toString(),
     "popularity : "+ movies[number].popularity.toString()
    ];
    for (int i = 0; i < names.length; i++) {
      swipeItems.add(SwipeItem(
        content: Content(text: names[i], color: colors[i]),
      ));
    }

    _matchEngine = MatchEngine(swipeItems: swipeItems);
    // _getmovies();
    //print(movies1);
  }

  void _getmovies() {
    movies1 = DataSources().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF1D2024),
          elevation: 0,
          title: Text("Search & Chill", style: theme.textTheme.headline1),
          leading: Container(
            color: const Color.fromARGB(255, 43, 50, 59),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, color: AppColors.secondary)),
          )),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            color: const Color.fromARGB(255, 43, 50, 59),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenHeight / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => ProfilePage(
                                        user: UserAccount(username: 'bochra'),
                                      ))));
                            },
                            icon: const Icon(Icons.account_circle_outlined)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const WatchListPage())));
                            },
                            icon: const Icon(Icons.bookmark)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => const SearchPage())));
                            },
                            icon: const Icon(Icons.search)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      const RecommandationPage())));
                            },
                            icon: const Icon(Icons.recommend_outlined))
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // TODO : log out the user
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const LoginOrSignUpPage())));
                      },
                      icon: const Icon(Icons.login))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List<Widget>.generate(
                      homePageGenres.length,
                      (int index) {
                        return FilterChip(
                          label: Text(homePageGenres.keys.toList()[index]),
                          avatar: Image.asset(
                            homePageGenres.values.toList()[index],
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                          selected: pickedFilters.pickedGenre !=
                              homePageGenres.keys.toList()[index],
                          onSelected: (bool selected) {
                            setState(() {
                              pickedFilters.pickedGenre =
                                  homePageGenres.keys.toList()[index];
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),*/
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: screenHeight / 2,
                            width: screenWidth / 2,
                            child: FirstPosterCard(movie: movies[number])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: screenHeight / 3,
                          width: screenWidth / 3,
                          child: SwipeCards(
                            matchEngine: _matchEngine,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: swipeItems[index].content.color,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25))),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    swipeItems[index].content.text,
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ),
                              );
                            },
                            onStackFinished: () {
                              setState(() {
                                _matchEngine =
                                    MatchEngine(swipeItems: swipeItems);
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Enough Facts For Today"),
                                duration: Duration(milliseconds: 1000),
                              ));
                            },
                            upSwipeAllowed: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Trending",
                      style: theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: screenHeight / 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return PosterCard(movie: movies[index]);
                        },
                        itemCount: movies.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Upcoming",
                      style: theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: screenHeight / 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return PosterCard(movie: movies[index]);
                        },
                        itemCount: movies.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
