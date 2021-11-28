class UpdateProfil {
  final String NIK;
  final String nama;
  final String alamat;
  final String email;
  final String tanggal_lahir;
  final String jenis_kelamin;
  final String no_telepon;
  final String username;
  final String password;
  final String foto_profil;
  final String status;

  UpdateProfil({
    this.NIK = '',
    this.nama = '',
    this.alamat = '',
    this.email = '',
    this.tanggal_lahir = '',
    this.jenis_kelamin = '',
    this.no_telepon = '',
    this.username = '',
    this.password = '',
    this.foto_profil = '',
    this.status = '',
  });

  factory UpdateProfil.fromJson(Map<String, dynamic> json) {
    return UpdateProfil(
      NIK: json['NIK'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      email: json['email'] as String,
      tanggal_lahir: json['tanggal_lahir'] as String,
      jenis_kelamin: json['jenis_kelamin'] as String,
      no_telepon: json['no_telepon'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      foto_profil: json['foto_profil'] as String,
      status: json['status'] as String,
    );
  }

  @override
  String toString() {
    return 'UpdateProfile{NIK: $NIK, nama: $nama, alamat: $alamat, email: $email, tanggal_lahir: $tanggal_lahir, jenis_kelamin: $jenis_kelamin, no_telepon: $no_telepon, username: $username ,password: $password,foto_profil: $foto_profil,status: $status}';
  }
}
