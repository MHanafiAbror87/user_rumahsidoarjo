// To parse this JSON data, do
//
//     final listUlasanData = listUlasanDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListUlasanModel listUlasanDataFromJson(String str) =>
    ListUlasanModel.fromJson(json.decode(str));

String listUlasanDataToJson(ListUlasanModel data) => json.encode(data.toJson());

class ListUlasanModel {
  ListUlasanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<UlasanData> data;

  factory ListUlasanModel.fromJson(Map<String, dynamic> json) =>
      ListUlasanModel(
        status: json["status"],
        message: json["message"],
        data: List<UlasanData>.from(
            json["data"].map((x) => UlasanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UlasanData {
  UlasanData({
    required this.idUlasan,
    required this.idWisata,
    required this.nik,
    required this.ulasan,
    required this.tanggalUpload,
    required this.foto1,
    required this.foto2,
    required this.foto3,
    required this.nama,
    required this.alamat,
    required this.email,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.noTelepon,
    required this.password,
    required this.fotoKtp,
    required this.fotoProfil,
    required this.selfieKtp,
    required this.status,
  });

  String idUlasan;
  String idWisata;
  String nik;
  String ulasan;
  DateTime tanggalUpload;
  String foto1;
  String foto2;
  String foto3;
  String nama;
  String alamat;
  String email;
  DateTime tanggalLahir;
  String jenisKelamin;
  String noTelepon;
  String password;
  String fotoKtp;
  String fotoProfil;
  String selfieKtp;
  String status;

  factory UlasanData.fromJson(Map<String, dynamic> json) => UlasanData(
        idUlasan: json["id_ulasan"],
        idWisata: json["id_wisata"],
        nik: json["NIK"],
        ulasan: json["ulasan"],
        tanggalUpload: DateTime.parse(json["tanggal_upload"]),
        foto1: json["foto1"],
        foto2: json["foto2"],
        foto3: json["foto3"],
        nama: json["nama"],
        alamat: json["alamat"],
        email: json["email"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        noTelepon: json["no_telepon"],
        password: json["password"],
        fotoKtp: json["foto_ktp"],
        fotoProfil: json["foto_profil"],
        selfieKtp: json["selfie_ktp"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_ulasan": idUlasan,
        "id_wisata": idWisata,
        "NIK": nik,
        "ulasan": ulasan,
        "tanggal_upload": tanggalUpload,
        "foto1": foto1,
        "foto2": foto2,
        "foto3": foto3,
        "nama": nama,
        "alamat": alamat,
        "email": email,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "no_telepon": noTelepon,
        "password": password,
        "foto_ktp": fotoKtp,
        "foto_profil": fotoProfil,
        "selfie_ktp": selfieKtp,
        "status": status,
      };
}
