import 'package:dio/dio.dart';
import 'package:yts/data/movies/movies_result.dart';
import 'package:yts/network/api_client.dart';

class MoviesDataSource {
  late Dio _dio;
  late ApiClient _apiClient;

  MoviesDataSource() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  Future<MoviesResult> getMovies(int page){
    return _apiClient.getMovies("14", page.toString());
  }

}
