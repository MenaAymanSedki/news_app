import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,

      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,

      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,

      ),
      label: 'Science',
    ),

  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();

    if(index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),


  ];

  List<dynamic> business = [];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    Diohelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apikey':'7a6ce71cd58345cd85cb6ebf47023226',
      },
    ).then((value) {
      business =value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));

    });

  }

  List<dynamic> sports = [];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    Diohelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apikey':'7a6ce71cd58345cd85cb6ebf47023226',
      },
    ).then((value) {
      sports =value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));

    });

  }


  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    Diohelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apikey':'7a6ce71cd58345cd85cb6ebf47023226',
      },
    ).then((value) {
      science =value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));

    });

  }


  List<Map<int,dynamic>> search = [];
  void getSearch(value)
  {
    emit(NewsGetSearchLoadingState());

    search = [];

    Diohelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apikey':'7a6ce71cd58345cd85cb6ebf47023226',
      },
    ).then((value) {
      search =value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));

    });

  }
  bool isDark = false;
  void changeAppMode()
  {
    isDark = !isDark;
    emit(NewsChangeModeState());

  }


}

