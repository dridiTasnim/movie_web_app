import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Models/filters.dart';
import 'package:movie_app/Models/pickedFilters.dart';
import 'package:movie_app/moviePage.dart';
import 'package:movie_app/search.dart';
import 'package:movie_app/watchList.dart';
import 'package:movie_app/widgets/filterWidget.dart';
import 'package:movie_app/widgets/firstPosterCard.dart';
import 'package:movie_app/widgets/posterCard.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:animations/animations.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'Models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Movie movie2= Movie(
      88,
      5.2,
      "sellaouti",
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
    Movie movie3= Movie(
      88,
      5.2,
      "aymen",
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
  List<Movie> movies = [];
  PickedFilters pickedFilters = PickedFilters();

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine _matchEngine = MatchEngine();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Swipe To Read Some Facts About Our Movie Of The Day",
    "Fact1",
    "Fact2",
    "Fact3"
  ];
  List<Color> _colors = [
    Color.fromARGB(255, 62, 100, 149),
    Color.fromARGB(255, 30, 89, 137),
    Color.fromARGB(255, 192, 125, 67),
    Color.fromARGB(255, 137, 124, 7),
  ];

  @override
  void initState() {
    super.initState();
    () async {
      movies = [
        movie,
        movie2,
        movie3
      ];
    }();
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
        content: Content(text: _names[i], color: _colors[i]),
      ));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ScrollController controller = ScrollController();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF1D2024),
          elevation: 0,
          title: Text(
            "Search & Chill",
            style: theme.textTheme.headline1,
          ),
          leading: Container(
            color: Color.fromARGB(255, 43, 50, 59),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.home,
                    color: Color(
                      0xFFF37515,
                    ))),
          )),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            color: Color.fromARGB(255, 43, 50, 59),
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
                            onPressed: () {},
                            icon: Icon(Icons.account_circle_outlined)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => WatchList())));
                            },
                            icon: Icon(Icons.bookmark)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => SearchPage())));
                            },
                            icon: Icon(Icons.search)),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.login))
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List<Widget>.generate(
                      genres.length,
                      (int index) {
                        return FilterChip(
                          label: Text(genres.keys.toList()[index]),
                          avatar: Image.asset(
                            genres.values.toList()[index],
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                          selected: pickedFilters.pickedGenres ==
                              genres.keys.toList()[index],
                          onSelected: (bool selected) {
                            setState(() {
                              pickedFilters.pickedGenres =
                                  selected ? genres.keys.toList()[index] : null;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: screenHeight / 2,
                            width: screenWidth / 2,
                            child: 
                                FirstPosterCard(movie: movies[0])
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: screenHeight / 3,
                          width: screenWidth / 3,
                          child: SwipeCards(
                            matchEngine: _matchEngine,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: _swipeItems[index].content.color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    _swipeItems[index].content.text,
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ),
                              );
                            },
                            onStackFinished: () {
                              setState(() {
                                _matchEngine =
                                    MatchEngine(swipeItems: _swipeItems);
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
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
                    padding: EdgeInsets.all(8),
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
                          return PosterCard(movie: movies[1]);
                        },
                        itemCount: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
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
                          return PosterCard(movie: movies[2]);
                        },
                        itemCount: 1,
                      ),
                    ),
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

class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}
