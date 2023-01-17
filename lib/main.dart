import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_web_app/features/home_page/pages/home_page.dart';
import 'package:movie_web_app/features/sign_in_sign_up/login_sign_up_page.dart';
import 'package:movie_web_app/features/watch_list/bloc/watch_list_bloc.dart';
import 'package:movie_web_app/shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WatchListBloc()..add(WatchListStarted()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Search & Chill',
          theme: Themedata.getTheme(),
          home: const LoginOrSignUpPage()),
    );
  }
}
