// To parse this JSON data, do
//
//     final lowonganPekerjaanModel = lowonganPekerjaanModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LowonganPekerjaanModel lowonganPekerjaanModelFromJson(String str) =>
    LowonganPekerjaanModel.fromJson(json.decode(str));

String lowonganPekerjaanModelToJson(LowonganPekerjaanModel data) =>
    json.encode(data.toJson());

class LowonganPekerjaanModel {
  LowonganPekerjaanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<LowonganPekerjaanData> data;

  factory LowonganPekerjaanModel.fromJson(Map<String, dynamic> json) =>
      LowonganPekerjaanModel(
        status: json["status"],
        message: json["message"],
        data: List<LowonganPekerjaanData>.from(
            json["data"].map((x) => LowonganPekerjaanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LowonganPekerjaanData {
  LowonganPekerjaanData({
    required this.idLowongan,
    required this.id,
    required this.judulLowongan,
    required this.deskripsiPekerjaan,
    required this.fotoLowongan,
    required this.file,
    required this.namaPerusahaan,
    required this.kepemilikan,
    required this.alamat,
    required this.noTlp,
    required this.email,
    required this.lat,
    required this.long,
    required this.penanggungJawab,
    required this.deskripsi,
    required this.foto,
    required this.website,
  });

  String idLowongan;
  String id;
  String judulLowongan;
  String deskripsiPekerjaan;
  String fotoLowongan;
  String file;
  String namaPerusahaan;
  String kepemilikan;
  String alamat;
  String noTlp;
  String email;
  String lat;
  String long;
  String penanggungJawab;
  String deskripsi;
  String foto;
  String website;

  factory LowonganPekerjaanData.fromJson(Map<String, dynamic> json) =>
      LowonganPekerjaanData(
        idLowongan: json["id_lowongan"],
        id: json["id"],
        judulLowongan: json["judul_lowongan"],
        deskripsiPekerjaan: json["deskripsi_pekerjaan"],
        fotoLowongan: json["foto_lowongan"],
        file: json["file"],
        namaPerusahaan: json["nama_perusahaan"],
        kepemilikan: json["kepemilikan"],
        alamat: json["alamat"],
        noTlp: json["no_tlp"],
        email: json["email"],
        lat: json["lat"],
        long: json["long"],
        penanggungJawab: json["penanggung_jawab"],
        deskripsi: json["deskripsi"],
        foto: json["foto"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id_lowongan": idLowongan,
        "id": id,
        "judul_lowongan": judulLowongan,
        "deskripsi_pekerjaan": deskripsiPekerjaan,
        "foto_lowongan": fotoLowongan,
        "file": file,
        "nama_perusahaan": namaPerusahaan,
        "kepemilikan": kepemilikan,
        "alamat": alamat,
        "no_tlp": noTlp,
        "email": email,
        "lat": lat,
        "long": long,
        "penanggung_jawab": penanggungJawab,
        "deskripsi": deskripsi,
        "foto": foto,
        "website": website,
      };
}
