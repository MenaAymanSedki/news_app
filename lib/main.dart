import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  runApp(MyApp());
  Diohelper.init();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> NewsCubit()..getBusiness())

      ],
       child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 20,
        ),
      ),
      darkTheme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepOrange,
            elevation: 20,
            backgroundColor: Colors.black12
        ),
        scaffoldBackgroundColor: Colors.black26,
        appBarTheme: const AppBarTheme(
          backwardsCompatibility: false,
          backgroundColor: Colors.black26,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black26,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          // titleTextStyle: TextStyle(
          //   color: Colors.white,
          //   fontSize: 18,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),

      ),
      themeMode: ThemeMode.light,
      home: NewsLayout(),
    ),

      );
  }
}
