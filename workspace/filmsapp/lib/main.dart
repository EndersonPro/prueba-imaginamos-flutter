import 'package:filmsapp/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:filmsapp/router/router.dart';
import 'package:filmsapp/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainBloc(
      child: MaterialApp(
        title: 'Films',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterApp.generateRoute,
        initialRoute: HomeScreen.homeScreen,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color(0xFF5aa0d4),
          primaryColor: Color(0xFF283546),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF1a1e23),
          accentColor: Color(0xFF0c2f47),
        ),
      ),
    );
  }
}
