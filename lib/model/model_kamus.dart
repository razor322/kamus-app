// To parse this JSON data, do
//
//     final modelKamus = modelKamusFromJson(jsonString);

import 'dart:convert';

ModelKamus modelKamusFromJson(String str) =>
    ModelKamus.fromJson(json.decode(str));

String modelKamusToJson(ModelKamus data) => json.encode(data.toJson());

class ModelKamus {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelKamus({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelKamus.fromJson(Map<String, dynamic> json) => ModelKamus(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String idKata;
  String kataIndonesia;
  String kataJerman;
  JenisKata jenisKata;
  String artiIndonesia;
  String artiJerman;
  String contohIndonesia;
  String contohJerman;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.idKata,
    required this.kataIndonesia,
    required this.kataJerman,
    required this.jenisKata,
    required this.artiIndonesia,
    required this.artiJerman,
    required this.contohIndonesia,
    required this.contohJerman,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idKata: json["id_kata"],
        kataIndonesia: json["kata_indonesia"],
        kataJerman: json["kata_jerman"],
        jenisKata: jenisKataValues.map[json["jenis_kata"]]!,
        artiIndonesia: json["arti_indonesia"],
        artiJerman: json["arti_jerman"],
        contohIndonesia: json["contoh_indonesia"],
        contohJerman: json["contoh_jerman"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_kata": idKata,
        "kata_indonesia": kataIndonesia,
        "kata_jerman": kataJerman,
        "jenis_kata": jenisKataValues.reverse[jenisKata],
        "arti_indonesia": artiIndonesia,
        "arti_jerman": artiJerman,
        "contoh_indonesia": contohIndonesia,
        "contoh_jerman": contohJerman,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum JenisKata { BENDA, KERJA, SIFAT }

final jenisKataValues = EnumValues({
  "benda": JenisKata.BENDA,
  "kerja": JenisKata.KERJA,
  "sifat": JenisKata.SIFAT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
