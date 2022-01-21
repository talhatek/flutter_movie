import 'package:json_annotation/json_annotation.dart';
import 'package:yts/data/movies/torrent.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  @JsonKey(name: 'description_full')
  String? descriptionFull;
  @JsonKey(name: ' description_intro')
  String? descriptionIntro;
  String? synopsis;
  String? language;
  @JsonKey(name: "background_image")
  String? backgroundImage;
  @JsonKey(name: "background_image_original")
  String? backgroundImageOriginal;
  @JsonKey(name: "small_cover_image")
  String? smallCoverImage;
  @JsonKey(name: "medium_cover_image")
  String? mediumCoverImage;
  @JsonKey(name: "large_cover_image")
  String? largeCoverImage;
  String? state;
  List<Torrent>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Movie(
      {this.id,
      this.url,
      this.imdbCode,
      this.title,
      this.titleEnglish,
      this.titleLong,
      this.slug,
      this.year,
      this.rating,
      this.runtime,
      this.genres,
      this.summary,
      this.descriptionFull,
      this.descriptionIntro,
      this.synopsis,
      this.language,
      this.backgroundImage,
      this.backgroundImageOriginal,
      this.smallCoverImage,
      this.mediumCoverImage,
      this.largeCoverImage,
      this.state,
      this.torrents,
      this.dateUploaded,
      this.dateUploadedUnix});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
