import 'package:json_annotation/json_annotation.dart';
import 'package:yts/data/movies/movies_data.dart';

part 'movies_result.g.dart';

@JsonSerializable()
class MoviesResult {
  String? status;
  String? statusMessage;
  MoviesData? data;

  MoviesResult({this.status, this.statusMessage, this.data});

  factory MoviesResult.fromJson(Map<String, dynamic> json) =>
      _$MoviesResultFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResultToJson(this);
}
