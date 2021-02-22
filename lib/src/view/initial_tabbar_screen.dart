import 'package:flutter/material.dart';
import 'package:restaurant_search_app_v1/src/view/v_search_page.dart';

class InitialTabbarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Restaurant"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: "LIST",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "SEARCH",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "RESULT SETTINGS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabView1(),
            SearchPage(),
            TabView3(),
          ],
        ),
      ),
    );
  }
}

class TabView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "LIST",
          style: TextStyle(
            color: Colors.white,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}

class TabView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          "SEARCH",
          style: TextStyle(
            color: Colors.white,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}

class TabView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text(
          "RESULT SETTINGS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
