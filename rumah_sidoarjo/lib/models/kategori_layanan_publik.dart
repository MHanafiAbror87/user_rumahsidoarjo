// To parse this JSON data, do
//
//     final kategoriLayananPublikModel = kategoriLayananPublikModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KategoriLayananPublikModel kategoriLayananPublikModelFromJson(String str) =>
    KategoriLayananPublikModel.fromJson(json.decode(str));

String kategoriLayananPublikModelToJson(KategoriLayananPublikModel data) =>
    json.encode(data.toJson());

class KategoriLayananPublikModel {
  KategoriLayananPublikModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<KategoriLayananData> data;

  factory KategoriLayananPublikModel.fromJson(Map<String, dynamic> json) =>
      KategoriLayananPublikModel(
        status: json["status"],
        message: json["message"],
        data: List<KategoriLayananData>.from(
            json["data"].map((x) => KategoriLayananData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class KategoriLayananData {
  KategoriLayananData({
    required this.idKategorilayanan,
    required this.namaKategori,
  });

  String idKategorilayanan;
  String namaKategori;

  factory KategoriLayananData.fromJson(Map<String, dynamic> json) =>
      KategoriLayananData(
        idKategorilayanan: json["id_kategorilayanan"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id_kategorilayanan": idKategorilayanan,
        "nama_kategori": namaKategori,
      };
}
