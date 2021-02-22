import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_search_app_v1/src/api.dart';
import 'package:restaurant_search_app_v1/src/model/mod_restaurant.dart';
import 'package:restaurant_search_app_v1/src/view/v_search_form.dart';
import 'package:restaurant_search_app_v1/src/view/v_search_page.dart';
import 'package:restaurant_search_app_v1/src/view/wid_restaurant_item.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _index = 0;
  String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Restaurant Search App"),
      ),
      body: Column(
        children: <Widget>[
          _index == 0
              ? Home(context)
              : (_index == 1
                  ? //SearchPage(title: "Restaurant")
                  Search(context)
                  : Settings(context)),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 18,
              right: 18,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _index == 0 ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 15.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: _index == 0 ? Colors.white : Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              _index == 0 ? "HOME" : "",
                              style: TextStyle(
                                color:
                                    _index == 0 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _index == 1 ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 15.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: _index == 1 ? Colors.white : Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              _index == 1 ? "SEARCH" : "",
                              style: TextStyle(
                                color:
                                    _index == 1 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _index == 2 ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 15.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: _index == 2 ? Colors.white : Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              _index == 2 ? "SETTINGS" : "",
                              style: TextStyle(
                                color:
                                    _index == 2 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Home(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          "Home",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget Search(BuildContext context) {
    final api = Provider.of<DicodingAPI>(context);
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchForm(
              onSearch: (q) {
                setState(() {
                  query = q;
                });
              },
            ),
            query == null
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black12,
                          size: 110,
                        ),
                        Text(
                          'No Results to display',
                          style: TextStyle(
                            color: Colors.black12,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                : FutureBuilder(
                    future: api.searchRestaurants(query),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView(
                            children: snapshot.data
                                .map<Widget>(
                                    (json) => RestaurantItem(Restaurant(json)))
                                .toList(),
                          ),
                        );
                      }

                      return Text(
                          'Error retrieving results: ${snapshot.error}');
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget Settings(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
