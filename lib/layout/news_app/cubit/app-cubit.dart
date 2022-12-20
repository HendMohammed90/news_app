import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/Articles.dart';
import 'package:news_app/data/repo/news_repo.dart';
import 'package:news_app/data/web_services/dio_helper.dart';
import 'package:news_app/layout/news_app/cubit/app-state.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/news/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cache_wrapper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int index = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    )
  ];
  List<Widget> screns = [ScienceScreen(), BusinessScreen(), SportsScreen()];

  void changeIndex(ind) {
    index = ind;
    if (index == 0) {
      getScience();
    }
    if (index == 1) {
      getBusiness();
    }
    if (index == 2) {
      getSports();
    }

    emit(ChangeBottomNavBarState());
  }

  late List<dynamic> business;
  late List<dynamic> sports;
  late List<dynamic> science;
  List<dynamic> searchList = [];

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'cadf9f9b30754500adea102e2eb31c8b'
    }).then((value) {
      // print(value.data.toString());
      business = value.data['articles'];
      emit(BusinessSuccessState());
    }).catchError((error) {
// return DioError(onError.);
      print(error.toString());
      emit(
        BusinessErrorState(error.toString()),
      );
    });
  }

  void getSports() {
    emit(SportsLoadingState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'cadf9f9b30754500adea102e2eb31c8b'
    }).then((value) {
      // print(value.data.toString());
      sports = value.data['articles'];
      emit(SportsSuccessState());
    }).catchError((error) {
// return DioError(onError.);
      print(error.toString());
      emit(
        SportsErrorState(error.toString()),
      );
    });
  }

  void getScience() {
    emit(ScienceLoadingState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': 'cadf9f9b30754500adea102e2eb31c8b'
    }).then((value) {
      // print(value.data.toString());
      science = value.data['articles'];
      emit(ScienceSuccessState());
    }).catchError((error) {
// return DioError(onError.);
      print(error.toString());
      emit(
        ScienceErrorState(error.toString()),
      );
    });
  }

  void getSearchData(String searchItem) {
    emit(NewsSearchLoadingState());
    searchList = [];
    DioHelper().getData(url: 'v2/everything', query: {
      'q': searchItem,
      'apiKey': 'cadf9f9b30754500adea102e2eb31c8b'
    }).then((value) {
      print(value.data.toString());
      searchList = value.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((error) {
// return DioError(onError.);
      print(error.toString());
      emit(
        NewsSearchFailedState(error.toString()),
      );
    });
  }

  bool isDark = true;

  void changeMode() {
    isDark = !isDark;
    CacheWrapper.putUserMoode(key: 'isDark', value: isDark).then(
      (value) {
        emit(AppChangeThemMode());
        print(value);
      },
    );
  }
}

//my old work
// void getBusiness() {
//   emit(NewsLoadingState());
//   CharacterRepo().getData().then((value) {
//     business = value;
//     print(business);
//     emit(NewsGetBusinessSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(
//       NewsGetBusinessErrorState(error.toString()),
//     );
//   });
// }
