class Umkm {
  final String kategori;
  final String nama;
  final String alamat;
  final String penanggung_jawab;
  final String foto1;
  final String foto2;
  final String foto3;
  final String deskripsi;
  final String no_telepon;
  final String website;

  Umkm({
    this.kategori = '',
    this.nama = '',
    this.alamat = '',
    this.penanggung_jawab = '',
    this.foto1 = '',
    this.foto2 = '',
    this.foto3 = '',
    this.deskripsi = '',
    this.no_telepon = '',
    this.website = '',
  });

  factory Umkm.fromJson(Map<String, dynamic> json) {
    return Umkm(
      kategori: json['kategori'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      penanggung_jawab: json['penanggung_jawab'] as String,
      foto1: json['foto1'] as String,
      foto2: json['foto2'] as String,
      foto3: json['foto3'] as String,
      deskripsi: json['deskripsi'] as String,
      no_telepon: json['no_telepon'] as String,
      website: json['website'] as String,
    );
  }

  @override
  String toString() {
    return 'Umkm{kategori: $kategori, nama: $nama, alamat: $alamat, penanggung_jawab: $penanggung_jawab, foto1: $foto1,foto2: $foto2,foto3: $foto3, deskripsi: $deskripsi, no_telepon: $no_telepon,website: $website}';
  }
}
