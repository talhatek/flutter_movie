// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResult _$MoviesResultFromJson(Map<String, dynamic> json) => MoviesResult(
      status: json['status'] as String?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] == null
          ? null
          : MoviesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesResultToJson(MoviesResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
    };
