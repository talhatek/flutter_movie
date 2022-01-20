
import 'package:json_annotation/json_annotation.dart';
import 'package:yts/data/movies/movie.dart';

part 'movies_data.g.dart';

@JsonSerializable()
class MoviesData{
  @JsonKey(name: 'movie_count')
  int? movieCount;

  int? limit;

  @JsonKey(name: 'page_number')
  int? page;

  List<Movie>? movies;

  MoviesData({this.movieCount, this.limit, this.page, this.movies});

  factory MoviesData.fromJson(Map<String, dynamic> json) =>
      _$MoviesDataFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDataToJson(this);

}