class Loker {
  final String id;
  final String judul_lowongan;
  final String deskripsi_pekerjaan;
  final String foto_lowongan;
  final String file;

  Loker({
    this.id = '',
    this.judul_lowongan = '',
    this.deskripsi_pekerjaan = '',
    this.foto_lowongan = '',
    this.file = '',
  });

  factory Loker.fromJson(Map<String, dynamic> json) {
    return Loker(
      id: json['id'] as String,
      judul_lowongan: json['judul_lowongan'] as String,
      deskripsi_pekerjaan: json['deskripsi_pekerjaan'] as String,
      foto_lowongan: json['foto_lowongan'] as String,
      file: json['file'] as String,
    );
  }

  @override
  String toString() {
    return 'Loker{id: $id, judul_lowongan: $judul_lowongan, deskripsi_pekerjaan: $deskripsi_pekerjaan, foto_lowongan: $foto_lowongan, file: $file}';
  }
}
