import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_web_app/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:movie_web_app/features/watch_list/widgets/watch_list_card.dart';
import 'package:movie_web_app/shared/colors.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          title: Text(
            "My Watch List",
            style: theme.textTheme.headline1,
          ),
        ),
        body: BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, state) {
            if (state is WatchListInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WatchListLoaded) {
              if (state.watchList.movies.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/watch_list.png"),
                      Text("No Element In Your WatchList Yet",
                          style: theme.textTheme.headline1)
                    ],
                  ),
                );
              }
              return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: screenHeight / 3),
                  itemCount: state.watchList.movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) {
                    return WatchListCard(
                      movie: state.watchList.movies[index],
                    );
                  });
            } else {
              return const Text('Please come back later :) ');
            }
          },
        ));
  }
}
