class Pendidikan {
  final String id_kelurahan;
  final String nama_sekolah;
  final String alamat;
  final String akreditasi;
  final String NPSN;
  final String no_telepon;
  final String jenjang;
  final String status;
  final String foto;
  final String website;

  Pendidikan({
    this.id_kelurahan = '',
    this.nama_sekolah = '',
    this.alamat = '',
    this.akreditasi = '',
    this.NPSN = '',
    this.no_telepon = '',
    this.jenjang = '',
    this.status = '',
    this.foto = '',
    this.website = '',
  });

  factory Pendidikan.fromJson(Map<String, dynamic> json) {
    return Pendidikan(
      id_kelurahan: json['id_kelurahan'] as String,
      nama_sekolah: json['nama_sekolah'] as String,
      alamat: json['alamat'] as String,
      akreditasi: json['akreditasi'] as String,
      NPSN: json['NPSN'] as String,
      no_telepon: json['no_telepon'] as String,
      jenjang: json['jenjang'] as String,
      status: json['status'] as String,
      foto: json['foto'] as String,
      website: json['website'] as String,
    );
  }

  @override
  String toString() {
    return 'Pendidikan{id_kelurahan: $id_kelurahan, nama_sekolah: $nama_sekolah, alamat: $alamat, akreditasi: $akreditasi, NPSN: $NPSN, no_telepon: $no_telepon, jenjang: $jenjang,foto: $foto,status: $status, website: $website}';
  }
}
