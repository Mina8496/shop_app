abstract class NewsState {}

class NewsInitialNewsState extends NewsState {}

class NewsButtonNavBarState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBussinesSuccesState extends NewsState {}

class NewsGetBussinesErrorState extends NewsState {
  final String error;
  NewsGetBussinesErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSuccesState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceSuccesState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class ChangeAppModeState extends NewsState {}

class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSuccesState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  final String error;
  NewsGetSearchErrorState(this.error);
}
