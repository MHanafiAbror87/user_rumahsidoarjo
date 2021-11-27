import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_services.dart';
import 'package:rumah_sidoarjo/models/register.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.137.1/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<Register>> getRegister() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Register> register =
          body.map((dynamic item) => Register.fromJson(item)).toList();
      return register;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Register> getRegisterById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Register.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a register');
    }
  }

  Future<Register> createRegister(Register register) async {
    Map data = {
      'NIK': register.NIK,
      'nama': register.nama,
      'alamat': register.alamat,
      'email': register.email,
      'tanggal_lahir': register.tanggal_lahir,
      'jenis_kelamin': register.jenis_kelamin,
      'no_telepon': register.no_telepon,
      'password': register.password,
      // 'foto_profil': register.foto_profil,
      'status': register.status
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Register.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post register');
    }
  }

  Future<Register> updateRegister(String id, Register register) async {
    Map data = {
      'NIK': register.NIK,
      'nama': register.nama,
      'alamat': register.alamat,
      'email': register.email,
      'tanggal_lahir': register.tanggal_lahir,
      'jenis_kelamin': register.jenis_kelamin,
      'no_telepon': register.no_telepon,
      'password': register.password,
      // 'foto_profil': register.foto_profil,
      'status': register.status
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Register.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a register');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Register deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
