class Login {
  final String username;
  final String password;
  final String status;

  Login({
    this.username = '',
    this.password = '',
    this.status = '',
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      username: json['username'] as String,
      password: json['password'] as String,
      status: json['status'] as String,
    );
  }

  @override
  String toString() {
    return 'Login{username: $username, password: $password, status: $status}';
  }
}
