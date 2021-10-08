abstract class NewsStates {}

class NewsInitState extends NewsStates {}

class BottomNavBarState extends NewsStates {}

class AppThemeState extends NewsStates {}

class GetBusinessNewsLoadingState extends NewsStates {}

class GetBusinessNewsSuccessState extends NewsStates {}

class GetBusinessNewsErrorState extends NewsStates {
  final String error;
  GetBusinessNewsErrorState(this.error);
}

class GetSportsNewsLoadingState extends NewsStates {}

class GetSportsNewsSuccessState extends NewsStates {}

class GetSportsNewsErrorState extends NewsStates {
  final String error;
  GetSportsNewsErrorState(this.error);
}

class GetScienceNewsLoadingState extends NewsStates {}

class GetScienceNewsSuccessState extends NewsStates {}

class GetScienceNewsErrorState extends NewsStates {
  final String error;
  GetScienceNewsErrorState(this.error);
}

class GetSearchLoadingState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchErrorState extends NewsStates {
  final String error;
  GetSearchErrorState(this.error);
}
