import 'package:dio/dio.dart';
import 'package:restaurant_search_app_v1/src/model/mod_category.dart';
import 'package:restaurant_search_app_v1/src/model/mod_search_options.dart';
import 'package:restaurant_search_app_v1/src/view/v_search_filters.dart';

const zLocations = ['city', 'subzone', 'zone', 'landmark', 'metro', 'group'];
const zSort = ['cost', 'rating'];
const zOrder = ['asc', 'desc'];
const double zMaxCount = 20; // result of ZOMATO API

class ZomatoAPI {
  final List<String> locations = zLocations;
  final List<String> sort = zSort;
  final List<String> order = zOrder;
  final double count = zMaxCount;

  final Dio _dio;

  final List<Category> categories = [];

  //List<int> _selectedCategoris = [];

  ZomatoAPI(String key)
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://restaurant-api.dicoding.dev/',
            /*headers: {
              'user-key': key,
              'Accept': 'application/json',
            },*/
          ),
        );
  Future loadCategories() async {
    final response = await _dio.get('categories');
    final data = response.data['categories'];
    categories.addAll(data.map<Category>((json) => Category(
          json['categories']['id'],
          json['categories']['name'],
        )));
  }

  Future<List> searchRestaurants(String query, SearchOptions options) async {
    final response = await _dio.get(
      'search',
      queryParameters: {
        'q': query,
        //...(options != null ? options.toJson() : {}),
        //'count': _filters?.count,
        //'sort': 'rating',
        //'order': 'desc',
      },
    );
    print(response);

    return response.data['restaurants'];
  }
}

class DicodingAPI {
  final Dio _dio;

  DicodingAPI()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://restaurant-api.dicoding.dev/',
            headers: {
              //'user-key': key,
              'Accept': 'application/json',
            },
          ),
        );

  Future<List> searchRestaurants(String query) async {
    final response = await _dio.get(
      'search',
      queryParameters: {
        'q': query,
        //...(options != null ? options.toJson() : {}),
        //'count': _filters?.count,
        //'sort': 'rating',
        //'order': 'desc',
      },
    );
    print(response);

    return response.data['restaurants'];
  }
}
