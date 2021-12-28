// To parse this JSON data, do
//
//     final layananPublikModel = layananPublikModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LayananPublikModel layananPublikModelFromJson(String str) =>
    LayananPublikModel.fromJson(json.decode(str));

String layananPublikModelToJson(LayananPublikModel data) =>
    json.encode(data.toJson());

class LayananPublikModel {
  LayananPublikModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<LayananPublikData> data;

  factory LayananPublikModel.fromJson(Map<String, dynamic> json) =>
      LayananPublikModel(
        status: json["status"],
        message: json["message"],
        data: List<LayananPublikData>.from(
            json["data"].map((x) => LayananPublikData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LayananPublikData {
  LayananPublikData({
    required this.idLayanan,
    required this.idKategorilayanan,
    required this.nama,
    required this.deskripsi,
    required this.namaKategori,
  });

  String idLayanan;
  String idKategorilayanan;
  String nama;
  String deskripsi;
  String namaKategori;

  factory LayananPublikData.fromJson(Map<String, dynamic> json) =>
      LayananPublikData(
        idLayanan: json["id_layanan"],
        idKategorilayanan: json["id_kategorilayanan"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id_layanan": idLayanan,
        "id_kategorilayanan": idKategorilayanan,
        "nama": nama,
        "deskripsi": deskripsi,
        "nama_kategori": namaKategori,
      };
}
