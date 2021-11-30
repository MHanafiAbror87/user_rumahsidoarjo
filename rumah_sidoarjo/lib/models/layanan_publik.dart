class LayananPublik {
  final String id_kategorilayanan;
  final String nama;
  final String deskripsi;

  LayananPublik({
    this.id_kategorilayanan = '',
    this.nama = '',
    this.deskripsi = '',
  });

  factory LayananPublik.fromJson(Map<String, dynamic> json) {
    return LayananPublik(
      id_kategorilayanan: json['id_kategorilayanan'] as String,
      nama: json['nama'] as String,
      deskripsi: json['deskripsi'] as String,
    );
  }

  @override
  String toString() {
    return 'LayananPublik{id_kategorilayanan: $id_kategorilayanan, nama: $nama, deskripsi: $deskripsi}';
  }
}
