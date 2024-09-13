import 'dart:convert';

class PulauResponseModel {
  final String? status;
  final List<Pulau>? data;

  PulauResponseModel({
    this.status,
    this.data,
  });

  factory PulauResponseModel.fromJson(String str) =>
      PulauResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PulauResponseModel.fromMap(Map<String, dynamic> json) =>
      PulauResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Pulau>.from(json["data"]!.map((x) => Pulau.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Pulau {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? namaPulau;

  Pulau({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.namaPulau,
  });

  factory Pulau.fromJson(String str) => Pulau.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pulau.fromMap(Map<String, dynamic> json) => Pulau(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        namaPulau: json["nama-pulau"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "nama-pulau": namaPulau,
      };
}
