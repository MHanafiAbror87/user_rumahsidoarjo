class Pariwisata {
  final String id_kategori_wisata;
  final String nama_wisata;
  final String alamat;
  final String pengelola;
  final String no_telepon;
  final String jam_buka;
  final String jam_tutup;
  final String foto1;
  final String foto2;
  final String foto3;

  Pariwisata({
    this.id_kategori_wisata = '',
    this.nama_wisata = '',
    this.alamat = '',
    this.pengelola = '',
    this.no_telepon = '',
    this.jam_buka = '',
    this.jam_tutup = '',
    this.foto1 = '',
    this.foto2 = '',
    this.foto3 = '',
  });

  factory Pariwisata.fromJson(Map<String, dynamic> json) {
    return Pariwisata(
      id_kategori_wisata: json['id_kategori_wisata'] as String,
      nama_wisata: json['nama_wisata'] as String,
      alamat: json['alamat'] as String,
      pengelola: json['pengelola'] as String,
      no_telepon: json['no_telepon'] as String,
      jam_buka: json['jam_buka'] as String,
      jam_tutup: json['jam_tutup'] as String,
      foto1: json['foto1'] as String,
      foto2: json['foto2'] as String,
      foto3: json['foto3'] as String,
    );
  }

  @override
  String toString() {
    return 'Pariwisata{id_kategori_wisata: $id_kategori_wisata, nama_wisata: $nama_wisata, alamat: $alamat, pengelola: $pengelola,no_telepon: $no_telepon,jam_buka: $jam_buka, jam_tutup: $jam_tutup,foto1: $foto1,foto2: $foto2, foto3: $foto3}';
  }
}
