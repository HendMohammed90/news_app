abstract class NewsStates {}

class AppInitialState extends NewsStates {}

//I think it will be unused -_-
class NewsAppBottomNavStateInitial extends NewsStates {}

class NewsAppChangeBottomNavBarState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class AppChangeThemMode extends NewsStates {}

// class AppUpdateDatabaseState extends AppStates {}
