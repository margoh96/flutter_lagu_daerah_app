import 'package:meta/meta.dart';
import 'dart:convert';

class LaguModel {
  int? id;
  String judul;
  String provinsi;
  String ibukota;

  String lyrics;
  String? imageUrl;
  int? pulauId;

  LaguModel({
    this.id,
    required this.judul,
    required this.provinsi,
    required this.ibukota,
    required this.lyrics,
    this.imageUrl,
    this.pulauId,
  });

  factory LaguModel.fromJson(String str) => LaguModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LaguModel.fromMap(Map<String, dynamic> json) => LaguModel(
        id: json["id"],
        judul: json["judul"],
        provinsi: json["provinsi"],
        ibukota: json["ibukota"],
        lyrics: json["lyrics"],
        imageUrl: json["image_url"],
        pulauId: json["pulau_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "judul": judul,
        "provinsi": provinsi,
        "ibukota": ibukota,
        "lyrics": lyrics,
        "image_url": imageUrl,
        "pulau_id": pulauId,
      };
}
