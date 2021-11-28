import 'dart:convert';
import 'package:rumah_sidoarjo/services/Login.dart';
import 'package:rumah_sidoarjo/models/login.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.137.1/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<Login>> getLogin() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Login> login =
          body.map((dynamic item) => Login.fromJson(item)).toList();
      return login;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Login> getRegisterById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a register');
    }
  }

  Future<Login> createRegister(Login login) async {
    Map data = {
      'username': login.username,
      'password': login.password,
      'status': login.status
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post login');
    }
  }

  Future<Login> updateLogin(String id, Login login) async {
    Map data = {
      'username': login.username,
      'password': login.password,
      'status': login.status
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a login');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Login deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
