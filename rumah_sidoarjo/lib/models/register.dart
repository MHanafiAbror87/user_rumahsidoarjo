class Register {
  final String NIK;
  final String nama;
  final String alamat;
  final String email;
  final String tanggal_lahir;
  final String jenis_kelamin;
  final String no_telepon;
  final String username;
  final String password;
  // final String foto_profil;
  final String status;

  Register({
    this.NIK = '',
    this.nama = '',
    this.alamat = '',
    this.email = '',
    this.tanggal_lahir = '',
    this.jenis_kelamin = '',
    this.no_telepon = '',
    this.username = '',
    this.password = '',
    // this.foto_profil,
    this.status = '',
  });

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      NIK: json['NIK'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      email: json['email'] as String,
      tanggal_lahir: json['tanggal_lahir'] as String,
      jenis_kelamin: json['jenis_kelamin'] as String,
      no_telepon: json['no_telepon'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      // foto_profil: json['foto_profil'] as String,
      // status: json['status'] as String,
    );
  }

  @override
  String toString() {
    return 'Register{NIK: $NIK, nama: $nama, alamat: $alamat, email: $email, tanggal_lahir: $tanggal_lahir, jenis_kelamin: $jenis_kelamin, no_telepon: $no_telepon,password: $password,username: $username, status: $status}';
  }
}
