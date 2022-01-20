import 'package:json_annotation/json_annotation.dart';

part 'torrent.g.dart';

@JsonSerializable()
class Torrent {
  String? url;
  String? hash;
  String? quality;
  String? type;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Torrent(
      {this.url,
      this.hash,
      this.quality,
      this.type,
      this.seeds,
      this.peers,
      this.size,
      this.sizeBytes,
      this.dateUploaded,
      this.dateUploadedUnix});

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}
