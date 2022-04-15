import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/model.dart';
import 'package:news_app/screens/home/pages/business/view.dart';
import 'package:news_app/screens/home/pages/science/view.dart';
import 'package:news_app/screens/home/pages/search/view.dart';
import 'package:news_app/screens/home/pages/sports/view.dart';
import 'package:news_app/screens/home/states.dart';



class HomeController extends Cubit<HomeState> {
  HomeController() : super(InitialState());

  static HomeController get(context) => BlocProvider.of(context);

  nav(index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  var pages = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SearchScreen(),
  ];

  int currentIndex = 0;
  var bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: 'search'),
  ];

  List<Articles>? business;

  getBusinessData() async {
    var response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e25a46d750994f79a478653e0328dcd5");
    NewsModel model = NewsModel.fromJson(response.data);
    business = model.articles;
    emit(GetBusinessLoadingState());
  }

  List<Articles>? sports;

  getSportsData() async {
    var response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=e25a46d750994f79a478653e0328dcd5");
    NewsModel model = NewsModel.fromJson(response.data);
    sports = model.articles;
    emit(GetBusinessLoadingState());
  }

  List<Articles>? science;

  getScienceData() async {
    var response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=e25a46d750994f79a478653e0328dcd5");
    NewsModel model = NewsModel.fromJson(response.data);
    science = model.articles;
    emit(GetBusinessLoadingState());
  }

  List<Articles>? search;

  getSearch(String? value) async {
    var response = await Dio().get(
        "https://newsapi.org/v2/everything?q=$value&from=2022-03-15&sortBy=publishedAt&apiKey=e25a46d750994f79a478653e0328dcd5");
    NewsModel model = NewsModel.fromJson(response.data);
    search = model.articles;
    emit(GetSearchLoadingState());
  }




}
