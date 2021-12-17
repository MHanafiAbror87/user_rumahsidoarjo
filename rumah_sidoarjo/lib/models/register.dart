// To parse this JSON data, do

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  DataRegister data;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json["status"],
        message: json["message"],
        data: DataRegister.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataRegister {
  DataRegister({
    required this.nik,
    required this.nama,
    this.alamat,
    required this.email,
    this.tanggalLahir,
    required this.jenisKelamin,
    required this.noTelepon,
    required this.password,
    this.status,
  });

  String nik;
  String nama;
  String? alamat;
  String email;
  String? tanggalLahir;
  String jenisKelamin;
  String noTelepon;
  String password;
  int? status;

  factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister(
        nik: json["NIK"],
        nama: json["nama"],
        alamat: json["alamat"],
        email: json["email"],
        tanggalLahir: json["tanggal_lahir"],
        jenisKelamin: json["jenis_kelamin"],
        noTelepon: json["no_telepon"],
        password: json["password"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "nama": nama,
        "alamat": alamat,
        "email": email,
        "tanggal_lahir": tanggalLahir,
        "jenis_kelamin": jenisKelamin,
        "no_telepon": noTelepon,
        "password": password,
        "status": status,
      };
}
