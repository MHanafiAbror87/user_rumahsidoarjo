// To parse this JSON data, do
//
//     final umkm = umkmFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Umkm umkmFromJson(String str) => Umkm.fromJson(json.decode(str));

String umkmToJson(Umkm data) => json.encode(data.toJson());

class Umkm {
  Umkm({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<UmkmModel> data;

  factory Umkm.fromJson(Map<String, dynamic> json) => Umkm(
        status: json["status"],
        message: json["message"],
        data: List<UmkmModel>.from(
            json["data"].map((x) => UmkmModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UmkmModel {
  UmkmModel({
    required this.idUmkm,
    required this.kategori,
    required this.nama,
    required this.alamat,
    required this.penanggungJawab,
    required this.foto1,
    required this.foto2,
    required this.foto3,
    required this.deskripsi,
    required this.lat,
    required this.long,
    required this.noTelp,
    required this.website,
  });

  String idUmkm;
  String kategori;
  String nama;
  String alamat;
  String penanggungJawab;
  String foto1;
  String foto2;
  String foto3;
  String deskripsi;
  String lat;
  String long;
  String noTelp;
  String website;

  factory UmkmModel.fromJson(Map<String, dynamic> json) => UmkmModel(
        idUmkm: json["id_umkm"],
        kategori: json["kategori"],
        nama: json["nama"],
        alamat: json["alamat"],
        penanggungJawab: json["penanggung_jawab"],
        foto1: json["foto1"],
        foto2: json["foto2"],
        foto3: json["foto3"],
        deskripsi: json["deskripsi"],
        lat: json["lat"],
        long: json["long"],
        noTelp: json["no_telp"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id_umkm": idUmkm,
        "kategori": kategori,
        "nama": nama,
        "alamat": alamat,
        "penanggung_jawab": penanggungJawab,
        "foto1": foto1,
        "foto2": foto2,
        "foto3": foto3,
        "deskripsi": deskripsi,
        "lat": lat,
        "long": long,
        "no_telp": noTelp,
        "website": website,
      };
}
