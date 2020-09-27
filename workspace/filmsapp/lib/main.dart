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
        // debugShowMaterialGrid: true,
        onGenerateRoute: RouterApp.generateRoute,
        initialRoute: HomeScreen.homeScreen,
      ),
    );
  }
}
