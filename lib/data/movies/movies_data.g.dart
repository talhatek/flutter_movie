// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesData _$MoviesDataFromJson(Map<String, dynamic> json) => MoviesData(
      movieCount: json['movie_count'] as int?,
      limit: json['limit'] as int?,
      page: json['page_number'] as int?,
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesDataToJson(MoviesData instance) =>
    <String, dynamic>{
      'movie_count': instance.movieCount,
      'limit': instance.limit,
      'page_number': instance.page,
      'movies': instance.movies,
    };
