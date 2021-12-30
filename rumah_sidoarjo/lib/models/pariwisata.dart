import 'dart:convert';

DetailPariwisataModel detailPariwisataFromJson(String str) =>
    DetailPariwisataModel.fromJson(json.decode(str));

String detailPariwisataToJson(DetailPariwisataModel data) =>
    json.encode(data.toJson());

class DetailPariwisataModel {
  DetailPariwisataModel({
    required this.status,
    required this.message,
    required this.pariwisata,
    required this.tarif,
    required this.ulasan,
    required this.menu,
  });

  bool status;
  String message;
  Pariwisata pariwisata;
  List<Tarif> tarif;
  List<Ulasan> ulasan;
  List<Menu> menu;

  factory DetailPariwisataModel.fromJson(Map<String, dynamic> json) =>
      DetailPariwisataModel(
        status: json["status"],
        message: json["message"],
        pariwisata: Pariwisata.fromJson(json["pariwisata"]),
        tarif: List<Tarif>.from(json["tarif"].map((x) => Tarif.fromJson(x))),
        ulasan:
            List<Ulasan>.from(json["ulasan"].map((x) => Ulasan.fromJson(x))),
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "pariwisata": pariwisata.toJson(),
        "tarif": List<dynamic>.from(tarif.map((x) => x.toJson())),
        "ulasan": List<dynamic>.from(ulasan.map((x) => x)),
        "menu": List<dynamic>.from(menu.map((x) => x)),
      };
}

class Pariwisata {
  Pariwisata({
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

  factory Pariwisata.fromJson(Map<String, dynamic> json) => Pariwisata(
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

class Tarif {
  Tarif({
    required this.idTarif,
    required this.idWisata,
    required this.tarif,
    required this.namaTiket,
  });

  String idTarif;
  String idWisata;
  String tarif;
  String namaTiket;

  factory Tarif.fromJson(Map<String, dynamic> json) => Tarif(
        idTarif: json["id_tarif"],
        idWisata: json["id_wisata"],
        tarif: json["tarif"],
        namaTiket: json["nama_tiket"],
      );

  Map<String, dynamic> toJson() => {
        "id_tarif": idTarif,
        "id_wisata": idWisata,
        "tarif": tarif,
        "nama_tiket": namaTiket,
      };
}

Ulasan ulasanFromJson(String str) => Ulasan.fromJson(json.decode(str));

String ulasanToJson(Ulasan data) => json.encode(data.toJson());

class Ulasan {
  Ulasan({
    required this.idUlasan,
    required this.idWisata,
    required this.nik,
    required this.ulasan,
    required this.foto1,
    required this.foto2,
    required this.foto3,
    required this.nama,
    required this.alamat,
    required this.email,
    required this.tanggalLahir,
    required this.tanggalUpload,
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
  String foto1;
  String foto2;
  String foto3;
  String nama;
  String alamat;
  String email;
  DateTime tanggalLahir;
  DateTime tanggalUpload;
  String jenisKelamin;
  String noTelepon;
  String password;
  String fotoKtp;
  String fotoProfil;
  String selfieKtp;
  String status;

  factory Ulasan.fromJson(Map<String, dynamic> json) => Ulasan(
        idUlasan: json["id_ulasan"],
        idWisata: json["id_wisata"],
        nik: json["NIK"],
        ulasan: json["ulasan"],
        foto1: json["foto1"],
        foto2: json["foto2"],
        foto3: json["foto3"],
        nama: json["nama"],
        alamat: json["alamat"],
        email: json["email"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        tanggalUpload: DateTime.parse(json["tanggal_upload"]),
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

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    required this.idKuliner,
    required this.idWisata,
    required this.nama,
    required this.harga,
  });

  String idKuliner;
  String idWisata;
  String nama;
  String harga;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        idKuliner: json["id_kuliner"],
        idWisata: json["id_wisata"],
        nama: json["nama"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "id_kuliner": idKuliner,
        "id_wisata": idWisata,
        "nama": nama,
        "harga": harga,
      };
}
