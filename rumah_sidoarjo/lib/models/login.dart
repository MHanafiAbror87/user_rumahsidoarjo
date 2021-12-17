// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  DataLogin data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: DataLogin.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class DataLogin {
  DataLogin({
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.email,
    this.tanggalLahir,
    required this.jenisKelamin,
    required this.noTelepon,
    required this.password,
    required this.fotoProfil,
  });

  String nik;
  String nama;
  String alamat;
  String email;
  DateTime? tanggalLahir;
  String jenisKelamin;
  String noTelepon;
  String password;
  String fotoProfil;

  @override
  String toString() {
    return {
      'nik': nik,
      'nama': nama,
      'alamat': alamat,
      'email': email,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'noTelepon': noTelepon,
      'password': password,
      'fotoProfil': fotoProfil,
    }.toString();
  }

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        nik: json["NIK"],
        nama: json["nama"],
        alamat: json["alamat"] ?? "-",
        email: json["email"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"] ?? "-",
        noTelepon: json["no_telepon"],
        password: json["password"],
        fotoProfil: json["foto_profil"] ?? "-",
      );

  // Map<String, dynamic> toJson() => {
  //       "NIK": nik,
  //       "nama": nama,
  //       "alamat": alamat,
  //       "email": email,
  //       "tanggal_lahir":
  //           "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
  //       "jenis_kelamin": jenisKelamin,
  //       "no_telepon": noTelepon,
  //       "password": password,
  //       "foto_profil": fotoProfil,
  //     };
}
