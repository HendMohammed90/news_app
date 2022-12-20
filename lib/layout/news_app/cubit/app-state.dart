abstract class NewsStates {}

//Initial states
class AppInitialState extends NewsStates {}

class BottomNavBarState extends NewsStates {}

//For NavBar
class ChangeBottomNavBarState extends NewsStates {}

//Business States
class BusinessLoadingState extends NewsStates {}

class BusinessSuccessState extends NewsStates {}

class BusinessErrorState extends NewsStates {
  final String error;
  BusinessErrorState(this.error);
}

//Sports States
class SportsLoadingState extends NewsStates {}

class SportsSuccessState extends NewsStates {}

class SportsErrorState extends NewsStates {
  final String error;
  SportsErrorState(this.error);
}

//Science States
class ScienceLoadingState extends NewsStates {}

class ScienceSuccessState extends NewsStates {}

class ScienceErrorState extends NewsStates {
  final String error;
  ScienceErrorState(this.error);
}

//Change Mode Light or Dark
class AppChangeThemMode extends NewsStates {}

//For Searching
class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchFailedState extends NewsStates {
  final String error;
  NewsSearchFailedState(this.error);
}

// class AppUpdateDatabaseState extends AppStates {}
