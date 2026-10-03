// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/core/network/local/cache_helper.dart';
// import 'package:news_app/core/network/remote/dio_helper.dart';
// import 'package:news_app/feature/Business_page/presentation/view/BusinessPage.dart';
// import 'package:news_app/core/manger/news_state.dart';
// import 'package:news_app/feature/science_page/presentation/pages/sciencePage.dart';
// import 'package:news_app/feature/settings_page/presentation/pages/settings_page.dart';
// import 'package:news_app/feature/sports_page/presentation/view/sports_page.dart';

// class NewsCubit extends Cubit<NewsState> {
//   NewsCubit() : super(NewsInitialNewsState());

//   static NewsCubit get(context) => BlocProvider.of(context);

//   int currentIndex = 0;

//   List<BottomNavigationBarItem> bottomItems = [
//     BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
//     BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
//     BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
//     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//   ];

//   List<Widget> screens = [
//     Businesspage(),
//     SportsPage(),
//     Sciencepage(),
//     SettingsPage(),
//   ];

//   bool isDark = false;
//   void changeAppMode({bool? fromShared}) {
//     if (fromShared != null) {
//       isDark = fromShared;
//       emit(ChangeAppModeState());
//     } else {
//       isDark = !isDark;
//       CacheHelper.putBoolen(key: 'isDark', value: isDark).then((value) {});
//       emit(ChangeAppModeState());
//     }
//   }

//   void changeBottomNavBar(int index) {
//     currentIndex = index;
//     if (index == 1) getsports();
//     emit(NewsButtonNavBarState());
//     if (index == 2) getScience();
//   }

//   // business
//   List<dynamic> business = [];

//   void getBusiness() {
//     emit(NewsGetBusinessLoadingState());
//     DioHelper.getData(
//           url: "v2/top-headlines",
//           query: {
//             'country': 'us',
//             'category': 'business',
//             'apiKey': '3b4f7eac4b7f41069dbfd1ef5d9873ad',

//             //GET https://newsapi.org/v2/everything?q=keyword&apiKey=3b4f7eac4b7f41069dbfd1ef5d9873ad
//           },
//         )
//         .then((value) {
//           // print(value.data["articles"][0]['title']);
//           business = value.data["articles"];
//           print(business[0]['title']);
//           emit(NewsGetBussinesSuccesState());
//         })
//         .catchError((error) {
//           print(error.toString());
//           emit(NewsGetBussinesErrorState(error.toString()));
//         });
//   }

//   //sports
//   List<dynamic> sports = [];

//   void getsports() {
//     emit(NewsGetBusinessLoadingState());

//     if (sports.isEmpty) {
//       DioHelper.getData(
//             url: "v2/top-headlines",
//             query: {
//               'country': 'us',
//               'category': 'sports',
//               'apiKey': '3b4f7eac4b7f41069dbfd1ef5d9873ad',

//               //GET https://newsapi.org/v2/everything?q=keyword&apiKey=3b4f7eac4b7f41069dbfd1ef5d9873ad
//             },
//           )
//           .then((value) {
//             // print(value.data["articles"][0]['title']);
//             sports = value.data["articles"];
//             print(sports[0]['title']);
//             emit(NewsGetSportsSuccesState());
//           })
//           .catchError((error) {
//             print(error.toString());
//             emit(NewsGetSportsErrorState(error.toString()));
//           });
//     } else {
//       emit(NewsGetSportsSuccesState());
//     }
//   }

//   // Science
//   List<dynamic> science = [];

//   void getScience() {
//     emit(NewsGetScienceLoadingState());
//     if (science.isEmpty) {
//       DioHelper.getData(
//             url: "v2/top-headlines",
//             query: {
//               'country': 'us',
//               'category': 'science',
//               'apiKey': '3b4f7eac4b7f41069dbfd1ef5d9873ad',

//               //GET https://newsapi.org/v2/everything?q=keyword&apiKey=3b4f7eac4b7f41069dbfd1ef5d9873ad
//             },
//           )
//           .then((value) {
//             // print(value.data["articles"][0]['title']);
//             science = value.data["articles"];
//             print(science[0]['title']);
//             emit(NewsGetScienceSuccesState());
//           })
//           .catchError((error) {
//             print(error.toString());
//             emit(NewsGetScienceErrorState(error.toString()));
//           });
//     } else {
//       emit(NewsGetScienceSuccesState());
//     }
//   }

//   // search
//   List<dynamic> search = [];

//   void getSearch(String valule) {
//     emit(NewsGetSearchLoadingState());
//     search = [];
//     // print(search[0]['title']);
//     DioHelper.getData(
//           url: 'v2/everything',
//           query: {'q': '$valule', 'apiKey': '3b4f7eac4b7f41069dbfd1ef5d9873ad'},
//         )
//         .then((value) {
//           search = value.data["articles"];
//           print(search[0]['title']);
//           emit(NewsGetSearchSuccesState());
//         })
//         .catchError((error) {
//           print(error.toString());
//           emit(NewsGetSearchErrorState(error.toString()));
//         });
//   }
// }
