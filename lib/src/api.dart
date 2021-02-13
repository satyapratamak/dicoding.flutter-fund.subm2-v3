import 'package:dio/dio.dart';

const zLocations = ['city', 'subzone', 'zone', 'landmark', 'metro', 'group'];
const zSort = ['cost', 'rating'];
const zOrder = ['asc', 'desc'];
const double zMaxCount = 20; // result of ZOMATO API

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
