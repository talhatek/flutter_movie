import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yts/data/movies/movies_result.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://yts.mx/api/v2/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/list_movies.json")
  Future<MoviesResult> getMovies(
      @Query("limit") String limit, @Query("page") String page);

  @GET("/movie_details.json.json")
  Future<MoviesResult> getMovieDetails(@Query("movie_id") String movieId);
}
