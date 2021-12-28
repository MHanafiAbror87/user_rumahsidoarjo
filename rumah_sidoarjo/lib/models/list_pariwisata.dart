import 'dart:convert';

ListPariwisataModel listPariwisataModelFromJson(String str) =>
    ListPariwisataModel.fromJson(json.decode(str));

String listPariwisataModelToJson(ListPariwisataModel data) =>
    json.encode(data.toJson());

class ListPariwisataModel {
  ListPariwisataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<PariwisataData> data;

  factory ListPariwisataModel.fromJson(Map<String, dynamic> json) =>
      ListPariwisataModel(
        status: json["status"],
        message: json["message"],
        data: List<PariwisataData>.from(
            json["data"].map((x) => PariwisataData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PariwisataData {
  PariwisataData({
    required this.idWisata,
    required this.idKategoriWisata,
    required this.namaWisata,
    required this.alamat,
    required this.pengelola,
    required this.noTelepon,
    required this.jamBuka,
    required this.jamTutup,
    required this.foto1,
    required this.foto2,
    required this.foto3,
    required this.lat,
    required this.long,
    required this.kategori,
  });

  String idWisata;
  String idKategoriWisata;
  String namaWisata;
  String alamat;
  String pengelola;
  String noTelepon;
  String jamBuka;
  String jamTutup;
  String foto1;
  String foto2;
  String foto3;
  String lat;
  String long;
  String kategori;

  factory PariwisataData.fromJson(Map<String, dynamic> json) => PariwisataData(
        idWisata: json["id_wisata"],
        idKategoriWisata: json["id_kategori_wisata"],
        namaWisata: json["nama_wisata"],
        alamat: json["alamat"],
        pengelola: json["pengelola"],
        noTelepon: json["no_telepon"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        foto1: json["foto1"],
        foto2: json["foto2"],
        foto3: json["foto3"],
        lat: json["lat"],
        long: json["long"],
        kategori: json["kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id_wisata": idWisata,
        "id_kategori_wisata": idKategoriWisata,
        "nama_wisata": namaWisata,
        "alamat": alamat,
        "pengelola": pengelola,
        "no_telepon": noTelepon,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "foto1": foto1,
        "foto2": foto2,
        "foto3": foto3,
        "lat": lat,
        "long": long,
        "kategori": kategori,
      };
}
