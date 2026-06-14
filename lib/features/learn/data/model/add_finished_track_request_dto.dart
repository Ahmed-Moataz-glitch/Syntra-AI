import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_request_entity.dart';

class AddFinishedTrackRequestDto {
  String? track;

  AddFinishedTrackRequestDto({this.track});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track'] = track;
    return data;
  }

  AddFinishedTrackRequestEntity toEntity() {
    return AddFinishedTrackRequestEntity(track: track ?? '');
  }
}
