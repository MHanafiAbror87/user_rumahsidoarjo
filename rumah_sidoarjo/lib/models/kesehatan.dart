class Kesehatan {
  final String id_kecamatan;
  final String nama;
  final String alamat;
  final String kepemilikan;
  final String kategori;
  final String no_telepon;
  final String fax;
  final String email;
  final String website;
  final String penanggung_jawab;
  final String foto;

  Kesehatan({
    this.id_kecamatan = '',
    this.nama = '',
    this.alamat = '',
    this.kepemilikan = '',
    this.kategori = '',
    this.no_telepon = '',
    this.fax = '',
    this.email = '',
    this.website = '',
    this.penanggung_jawab = '',
    this.foto = '',
  });

  factory Kesehatan.fromJson(Map<String, dynamic> json) {
    return Kesehatan(
      id_kecamatan: json['id_kecamatan'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      kepemilikan: json['kepemilikan'] as String,
      kategori: json['kategori'] as String,
      no_telepon: json['no_telepon'] as String,
      fax: json['fax'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      penanggung_jawab: json['penanggung_jawab'] as String,
      foto: json['foto'] as String,
    );
  }

  @override
  String toString() {
    return 'Kesehatan{id_kecamatan: $id_kecamatan, nama: $nama, alamat: $alamat, kepemilikan: $kepemilikan, kategori: $kategori, no_telepon: $no_telepon, fax: $fax, email: $email, website: $website, penanggung_jawab: $penanggung_jawab, foto: $foto}';
  }
}
