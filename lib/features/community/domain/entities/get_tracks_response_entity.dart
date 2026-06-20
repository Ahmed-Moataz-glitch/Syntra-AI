class GetTracksResponseEntity {
  List<TracksEntity> tracks;

  GetTracksResponseEntity({this.tracks = const []});
}

class TracksEntity {
  String id;
  String labelEn;
  String labelAr;
  String icon;
  String taglineEn;
  String taglineAr;

  TracksEntity(
      {this.id = '',
      this.labelEn = '',
      this.labelAr = '',
      this.icon = '',
      this.taglineEn = '',
      this.taglineAr = ''});
}
