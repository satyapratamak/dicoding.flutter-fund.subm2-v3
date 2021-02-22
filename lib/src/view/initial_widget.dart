import 'package:flutter/material.dart';
import 'package:restaurant_search_app_v1/src/view/initial_screen.dart';
import 'package:restaurant_search_app_v1/src/view/initial_tabbar_screen.dart';
import 'package:restaurant_search_app_v1/src/view/v_search_page.dart';
import 'package:restaurant_search_app_v1/style.dart';

class InitialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      //home: InitialScreen(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        //'home': (context) => InitialScreen(),
        //'home': (context) => InitialTabbarScreen(),
        //'home': (context) => InitialNavDrawerScreen(),
        'home': (context) => SearchPage(title: "Search"),
        //'settings': (context) => Settings(),
      },
    );
  }
}
