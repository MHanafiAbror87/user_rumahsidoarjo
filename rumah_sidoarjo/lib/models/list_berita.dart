// To parse this JSON data, do
//
//     final listBeritaModel = listBeritaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ListBeritaModel> listBeritaModelFromJson(String str) =>
    List<ListBeritaModel>.from(
        json.decode(str).map((x) => ListBeritaModel.fromJson(x)));

String listBeritaModelToJson(List<ListBeritaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListBeritaModel {
  ListBeritaModel({
    required this.id,
    required this.slug,
    required this.thumb,
    required this.tgl,
    required this.judul,
    required this.isiberita,
  });

  String id;
  String slug;
  String thumb;
  DateTime tgl;
  String judul;
  String isiberita;

  factory ListBeritaModel.fromJson(Map<String, dynamic> json) =>
      ListBeritaModel(
        id: json["id"],
        slug: json["slug"],
        thumb: json["thumb"],
        tgl: DateTime.parse(json["tgl"]),
        judul: json["judul"],
        isiberita: json["isiberita"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "thumb": thumb,
        "tgl": tgl,
        "judul": judul,
        "isiberita": isiberita,
      };
}
