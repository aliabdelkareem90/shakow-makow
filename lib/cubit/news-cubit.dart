import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakow_makow/cubit/news-states.dart';
import 'package:shakow_makow/local/shared-pref-helper.dart';
import 'package:shakow_makow/network/dio-helper.dart';
import 'package:shakow_makow/screens/business-screen.dart';
import 'package:shakow_makow/screens/science-screen.dart';
import 'package:shakow_makow/screens/sports-screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBarState(index) {
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    currentIndex = index;
    emit(BottomNavBarState());
  }

  bool isDark = false;

  changeThemeMode({bool? isDarkMode}) {
    if (isDarkMode != null) {
      isDark = isDarkMode;
      emit(AppThemeState());
    } else {
      isDark = !isDark;
      SharedPrefHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        SharedPrefHelper.getBoolean(key: 'isDark');
        emit(AppThemeState());
      });
    }
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(GetBusinessNewsLoadingState());

    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'ea74d2ab35164ad9b48bb00d80a22edd',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);

        emit(GetBusinessNewsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetBusinessNewsErrorState(error.toString()));
      });
    } else {
      emit(GetBusinessNewsSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsNewsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'ea74d2ab35164ad9b48bb00d80a22edd',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'] as List;
        print(sports[0]['title']);

        emit(GetSportsNewsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportsNewsErrorState(error.toString()));
      });
    } else {
      emit(GetSportsNewsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(GetScienceNewsLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'ea74d2ab35164ad9b48bb00d80a22edd',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'] as List;
        print(science[0]['title']);

        emit(GetScienceNewsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceNewsErrorState(error.toString()));
      });
    } else {
      emit(GetScienceNewsSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearchResults(String value) {
    emit(GetSearchLoadingState());
    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': 'ea74d2ab35164ad9b48bb00d80a22edd',
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'] as List;

      emit(GetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErrorState(error.toString()));
    });
  }
}
