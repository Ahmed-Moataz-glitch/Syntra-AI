import 'package:syntra_ai/features/community/domain/entities/get_languages_response_entity.dart';

class GetLanguagesResponseDto {
  List<Languages>? languages;

  GetLanguagesResponseDto({this.languages});

  GetLanguagesResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
  }

  GetLanguagesResponseEntity toEntity() {
    return GetLanguagesResponseEntity(
      languages: languages?.map((language) => language.toEntity()).toList() ?? [],
    );
  }
}

class Languages {
  String? code;
  String? labelEn;
  String? labelAr;

  Languages({this.code, this.labelEn, this.labelAr});

  Languages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    labelEn = json['label_en'];
    labelAr = json['label_ar'];
  }

  LanguagesEntity toEntity() {
    return LanguagesEntity(
      code: code ?? '',
      labelEn: labelEn ?? '',
      labelAr: labelAr ?? '',
    );
  }
}
