import 'package:syntra_ai/features/community/domain/entities/get_tracks_response_entity.dart';

class GetTracksResponseDto {
  List<Tracks>? tracks;

  GetTracksResponseDto({this.tracks});

  GetTracksResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['tracks'] != null) {
      tracks = <Tracks>[];
      json['tracks'].forEach((v) {
        tracks!.add(Tracks.fromJson(v));
      });
    }
  }

  GetTracksResponseEntity toEntity() {
    return GetTracksResponseEntity(
      tracks: tracks?.map((track) => track.toEntity()).toList() ?? [],
    );
  }
}

class Tracks {
  String? id;
  String? labelEn;
  String? labelAr;
  String? icon;
  String? taglineEn;
  String? taglineAr;

  Tracks(
      {this.id,
      this.labelEn,
      this.labelAr,
      this.icon,
      this.taglineEn,
      this.taglineAr});

  Tracks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labelEn = json['label_en'];
    labelAr = json['label_ar'];
    icon = json['icon'];
    taglineEn = json['tagline_en'];
    taglineAr = json['tagline_ar'];
  }

  TracksEntity toEntity() {
    return TracksEntity(
      id: id ?? '',
      labelEn: labelEn ?? '',
      labelAr: labelAr ?? '',
      icon: icon ?? '',
      taglineEn: taglineEn ?? '',
      taglineAr: taglineAr ?? '',
    );
  }
}
