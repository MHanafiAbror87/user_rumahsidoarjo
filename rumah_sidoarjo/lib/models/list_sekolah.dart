// To parse this JSON data, do
//
//     final listSekolahModel = listSekolahModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListSekolahModel listSekolahModelFromJson(String str) =>
    ListSekolahModel.fromJson(json.decode(str));

String listSekolahModelToJson(ListSekolahModel data) =>
    json.encode(data.toJson());

class ListSekolahModel {
  ListSekolahModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<SekolahData> data;

  factory ListSekolahModel.fromJson(Map<String, dynamic> json) =>
      ListSekolahModel(
        status: json["status"],
        message: json["message"],
        data: List<SekolahData>.from(
            json["data"].map((x) => SekolahData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SekolahData {
  SekolahData({
    required this.idSekolah,
    required this.idKelurahan,
    required this.namaSekolah,
    required this.alamat,
    required this.akreditasi,
    required this.npsn,
    required this.noTelepon,
    required this.jenjang,
    required this.status,
    required this.foto,
    required this.lat,
    required this.long,
    required this.website,
    required this.idKecamatan,
    required this.nama,
    required this.kecamatan,
  });

  String idSekolah;
  String idKelurahan;
  String namaSekolah;
  String alamat;
  String akreditasi;
  String npsn;
  String noTelepon;
  String jenjang;
  String status;
  String foto;
  String lat;
  String long;
  String website;
  String idKecamatan;
  String nama;
  String kecamatan;

  factory SekolahData.fromJson(Map<String, dynamic> json) => SekolahData(
        idSekolah: json["id_sekolah"],
        idKelurahan: json["id_kelurahan"],
        namaSekolah: json["nama_sekolah"],
        alamat: json["alamat"],
        akreditasi: json["akreditasi"],
        npsn: json["NPSN"],
        noTelepon: json["no_telepon"],
        jenjang: json["jenjang"],
        status: json["status"],
        foto: json["foto"],
        lat: json["lat"],
        long: json["long"],
        website: json["website"],
        idKecamatan: json["id_kecamatan"],
        nama: json["nama"],
        kecamatan: json["kecamatan"],
      );

  Map<String, dynamic> toJson() => {
        "id_sekolah": idSekolah,
        "id_kelurahan": idKelurahan,
        "nama_sekolah": namaSekolah,
        "alamat": alamat,
        "akreditasi": akreditasi,
        "NPSN": npsn,
        "no_telepon": noTelepon,
        "jenjang": jenjang,
        "status": status,
        "foto": foto,
        "lat": lat,
        "long": long,
        "website": website,
        "id_kecamatan": idKecamatan,
        "nama": nama,
        "kecamatan": kecamatan,
      };
}
