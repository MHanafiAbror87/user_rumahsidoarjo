class Login {
  final String email;
  final String password;
  final String status;

  Login({
    this.email = '',
    this.password = '',
    this.status = '',
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      email: json['email'] as String,
      password: json['password'] as String,
      status: json['status'] as String,
    );
  }

  @override
  String toString() {
    return 'Login{email: $email, password: $password, status: $status}';
  }
}
