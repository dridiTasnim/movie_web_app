import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/WatchList/watch_list_bloc.dart';
import 'package:movie_app/widgets/watchListCard.dart';


class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D2024),
        elevation: 0,
        title: Text(
          "My Watch List",
          style: theme.textTheme.headline1,
        ),
      ),
      body: BlocBuilder<WatchListBloc, WatchListState>(
        builder: (context, state) {
          if(state is WatchListInitial){
            return Center(
            child: CircularProgressIndicator(),
          );
          }
          if(state is WatchListLoaded){
            if(state.watchList.movies.isEmpty){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Image.asset("WatchList.png"),
                    Text("No Element In Your WatchList Yet",style: theme.textTheme.headline1,),
                    
                  ],
                ),
              );
            }
            return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: screenHeight/3),  
      itemCount: state.watchList.movies.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 20) , itemBuilder: (BuildContext context, int index){
        return WatchListCard(movie: state.watchList.movies[index],);
      });
          } else{
            return Text('Please come back later :) ');
          }
          
        },
      )
    );
  }
}
