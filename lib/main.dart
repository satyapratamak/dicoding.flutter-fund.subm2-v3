import 'package:flutter/material.dart';
import 'package:restaurant_search_app_v1/src/app_restaurant_search.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search_app_v1/src/api.dart';
import 'package:restaurant_search_app_v1/src/view/initial_screen.dart';
import 'package:restaurant_search_app_v1/src/view/initial_widget.dart';

void main() async {
  final api = DicodingAPI();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => api,
        ),
      ],
      //child: RestaurantSearchApp(),
      child: InitialWidget(),
    ),
  );
}
