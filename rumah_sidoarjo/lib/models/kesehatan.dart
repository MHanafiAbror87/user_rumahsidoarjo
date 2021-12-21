// To parse this JSON data, do
//
//     final kesehatanModel = kesehatanModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KesehatanModel kesehatanModelFromJson(String str) =>
    KesehatanModel.fromJson(json.decode(str));

String kesehatanModelToJson(KesehatanModel data) => json.encode(data.toJson());

class KesehatanModel {
  KesehatanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<KesehatanData> data;

  factory KesehatanModel.fromJson(Map<String, dynamic> json) => KesehatanModel(
        status: json["status"],
        message: json["message"],
        data: List<KesehatanData>.from(
            json["data"].map((x) => KesehatanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class KesehatanData {
  KesehatanData({
    required this.idKesehatan,
    required this.idKecamatan,
    required this.nama,
    required this.alamat,
    required this.kepemilikan,
    required this.kategori,
    required this.noTelepon,
    required this.fax,
    required this.email,
    required this.website,
    required this.penanggungJawab,
    required this.foto,
    required this.lat,
    required this.long,
    required this.link,
    required this.kecamatan,
  });

  String idKesehatan;
  String idKecamatan;
  String nama;
  String alamat;
  String kepemilikan;
  String kategori;
  String noTelepon;
  String fax;
  String email;
  String website;
  String penanggungJawab;
  String foto;
  String lat;
  String long;
  String link;
  String kecamatan;

  factory KesehatanData.fromJson(Map<String, dynamic> json) => KesehatanData(
        idKesehatan: json["id_kesehatan"],
        idKecamatan: json["id_kecamatan"],
        nama: json["nama"],
        alamat: json["alamat"],
        kepemilikan: json["kepemilikan"],
        kategori: json["kategori"],
        noTelepon: json["no_telepon"],
        fax: json["fax"],
        email: json["email"],
        website: json["website"],
        penanggungJawab: json["penanggung_jawab"],
        foto: json["foto"],
        lat: json["lat"],
        long: json["long"],
        link: json["link"],
        kecamatan: json["kecamatan"],
      );

  Map<String, dynamic> toJson() => {
        "id_kesehatan": idKesehatan,
        "id_kecamatan": idKecamatan,
        "nama": nama,
        "alamat": alamat,
        "kepemilikan": kepemilikan,
        "kategori": kategori,
        "no_telepon": noTelepon,
        "fax": fax,
        "email": email,
        "website": website,
        "penanggung_jawab": penanggungJawab,
        "foto": foto,
        "lat": lat,
        "long": long,
        "link": link,
        "kecamatan": kecamatan,
      };
}
