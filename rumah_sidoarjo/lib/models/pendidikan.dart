import 'dart:convert';

DetailSekolahModel detailSekolahModelFromJson(String str) =>
    DetailSekolahModel.fromJson(json.decode(str));

String detailSekolahModelToJson(DetailSekolahModel data) =>
    json.encode(data.toJson());

class DetailSekolahModel {
  DetailSekolahModel({
    required this.status,
    required this.message,
    required this.sekolah,
    required this.ekskul,
    required this.fasilitas,
  });

  bool status;
  String message;
  Sekolah sekolah;
  List<Ekskul> ekskul;
  List<Fasilitas> fasilitas;

  factory DetailSekolahModel.fromJson(Map<String, dynamic> json) =>
      DetailSekolahModel(
        status: json["status"],
        message: json["message"],
        sekolah: Sekolah.fromJson(json["sekolah"]),
        ekskul:
            List<Ekskul>.from(json["ekskul"].map((x) => Ekskul.fromJson(x))),
        fasilitas: List<Fasilitas>.from(
            json["fasilitas"].map((x) => Fasilitas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "sekolah": sekolah.toJson(),
        "ekskul": List<dynamic>.from(ekskul.map((x) => x.toJson())),
        "fasilitas": List<dynamic>.from(fasilitas.map((x) => x.toJson())),
      };
}

class Ekskul {
  Ekskul({
    required this.idEkskul,
    required this.idSekolah,
    required this.nama,
  });

  String idEkskul;
  String idSekolah;
  String nama;

  factory Ekskul.fromJson(Map<String, dynamic> json) => Ekskul(
        idEkskul: json["id_ekskul"],
        idSekolah: json["id_sekolah"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id_ekskul": idEkskul,
        "id_sekolah": idSekolah,
        "nama": nama,
      };
}

class Fasilitas {
  Fasilitas({
    required this.idFasilitas,
    required this.idSekolah,
    required this.nama,
  });

  String idFasilitas;
  String idSekolah;
  String nama;

  factory Fasilitas.fromJson(Map<String, dynamic> json) => Fasilitas(
        idFasilitas: json["id_fasilitas"],
        idSekolah: json["id_sekolah"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id_fasilitas": idFasilitas,
        "id_sekolah": idSekolah,
        "nama": nama,
      };
}

class Sekolah {
  Sekolah({
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
    required this.email,
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
  String email;
  String idKecamatan;
  String nama;
  String kecamatan;

  factory Sekolah.fromJson(Map<String, dynamic> json) => Sekolah(
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
        email: json["email"],
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
        "email": email,
        "id_kecamatan": idKecamatan,
        "nama": nama,
        "kecamatan": kecamatan,
      };
}
