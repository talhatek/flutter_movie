// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int?,
      url: json['url'] as String?,
      imdbCode: json['imdbCode'] as String?,
      title: json['title'] as String?,
      titleEnglish: json['titleEnglish'] as String?,
      titleLong: json['titleLong'] as String?,
      slug: json['slug'] as String?,
      year: json['year'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: json['runtime'] as int?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      summary: json['summary'] as String?,
      descriptionFull: json['descriptionFull'] as String?,
      synopsis: json['synopsis'] as String?,
      ytTrailerCode: json['ytTrailerCode'] as String?,
      language: json['language'] as String?,
      mpaRating: json['mpaRating'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      backgroundImageOriginal: json['backgroundImageOriginal'] as String?,
      smallCoverImage: json['smallCoverImage'] as String?,
      mediumCoverImage: json['mediumCoverImage'] as String?,
      largeCoverImage: json['largeCoverImage'] as String?,
      state: json['state'] as String?,
      torrents: (json['torrents'] as List<dynamic>?)
          ?.map((e) => Torrent.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateUploaded: json['dateUploaded'] as String?,
      dateUploadedUnix: json['dateUploadedUnix'] as int?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdbCode': instance.imdbCode,
      'title': instance.title,
      'titleEnglish': instance.titleEnglish,
      'titleLong': instance.titleLong,
      'slug': instance.slug,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'summary': instance.summary,
      'descriptionFull': instance.descriptionFull,
      'synopsis': instance.synopsis,
      'ytTrailerCode': instance.ytTrailerCode,
      'language': instance.language,
      'mpaRating': instance.mpaRating,
      'backgroundImage': instance.backgroundImage,
      'backgroundImageOriginal': instance.backgroundImageOriginal,
      'smallCoverImage': instance.smallCoverImage,
      'mediumCoverImage': instance.mediumCoverImage,
      'largeCoverImage': instance.largeCoverImage,
      'state': instance.state,
      'torrents': instance.torrents,
      'dateUploaded': instance.dateUploaded,
      'dateUploadedUnix': instance.dateUploadedUnix,
    };
