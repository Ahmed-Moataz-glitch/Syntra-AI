class GetLanguagesResponseEntity {
  List<LanguagesEntity> languages;

  GetLanguagesResponseEntity({this.languages = const []});
}

class LanguagesEntity {
  String code;
  String labelEn;
  String labelAr;

  LanguagesEntity({this.code = '', this.labelEn = '', this.labelAr = ''});
}
