// To parse this JSON data, do
//
//     final detailUmkmModel = detailUmkmModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DetailUmkmModel detailUmkmModelFromJson(String str) =>
    DetailUmkmModel.fromJson(json.decode(str));

String detailUmkmModelToJson(DetailUmkmModel data) =>
    json.encode(data.toJson());

class DetailUmkmModel {
  DetailUmkmModel({
    required this.status,
    required this.message,
    required this.umkm,
    required this.ulasan,
  });

  bool status;
  String message;
  Umkm umkm;
  List<Ulasan> ulasan;

  factory DetailUmkmModel.fromJson(Map<String, dynamic> json) =>
      DetailUmkmModel(
        status: json["status"],
        message: json["message"],
        umkm: Umkm.fromJson(json["umkm"]),
        ulasan:
            List<Ulasan>.from(json["ulasan"].map((x) => Ulasan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "umkm": umkm.toJson(),
        "ulasan": List<dynamic>.from(ulasan.map((x) => x.toJson())),
      };
}

class Ulasan {
  Ulasan({
    required this.idUlasan,
    required this.idUmkm,
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
  String idUmkm;
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

  factory Ulasan.fromJson(Map<String, dynamic> json) => Ulasan(
        idUlasan: json["id_ulasan"],
        idUmkm: json["id_umkm"],
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
        "id_umkm": idUmkm,
        "NIK": nik,
        "ulasan": ulasan,
        "tanggal_upload":
            "${tanggalUpload.year.toString().padLeft(4, '0')}-${tanggalUpload.month.toString().padLeft(2, '0')}-${tanggalUpload.day.toString().padLeft(2, '0')}",
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

class Umkm {
  Umkm({
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

  factory Umkm.fromJson(Map<String, dynamic> json) => Umkm(
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
