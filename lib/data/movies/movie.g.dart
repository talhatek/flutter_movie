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
      descriptionFull: json['description_full'] as String?,
      descriptionIntro: json[' description_intro'] as String?,
      synopsis: json['synopsis'] as String?,
      language: json['language'] as String?,
      backgroundImage: json['background_image'] as String?,
      backgroundImageOriginal: json['background_image_original'] as String?,
      smallCoverImage: json['small_cover_image'] as String?,
      mediumCoverImage: json['medium_cover_image'] as String?,
      largeCoverImage: json['large_cover_image'] as String?,
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
      'description_full': instance.descriptionFull,
      ' description_intro': instance.descriptionIntro,
      'synopsis': instance.synopsis,
      'language': instance.language,
      'background_image': instance.backgroundImage,
      'background_image_original': instance.backgroundImageOriginal,
      'small_cover_image': instance.smallCoverImage,
      'medium_cover_image': instance.mediumCoverImage,
      'large_cover_image': instance.largeCoverImage,
      'state': instance.state,
      'torrents': instance.torrents,
      'dateUploaded': instance.dateUploaded,
      'dateUploadedUnix': instance.dateUploadedUnix,
    };
