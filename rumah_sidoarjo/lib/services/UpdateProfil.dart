import 'dart:convert';
import 'package:rumah_sidoarjo/services/UpdateProfil.dart';
import 'package:rumah_sidoarjo/models/update_profil.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.137.1/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<UpdateProfil>> getUpdateProfil() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<UpdateProfil> update =
          body.map((dynamic item) => UpdateProfil.fromJson(item)).toList();
      return update;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<UpdateProfil> getUpdateProfilById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return UpdateProfil.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a update');
    }
  }

  Future<UpdateProfil> createUpdateProfil(UpdateProfil update) async {
    Map data = {
      'NIK': update.NIK,
      'nama': update.nama,
      'alamat': update.alamat,
      'email': update.email,
      'tanggal_lahir': update.tanggal_lahir,
      'jenis_kelamin': update.jenis_kelamin,
      'no_telepon': update.no_telepon,
      'password': update.password,
      'foto_profil': update.foto_profil,
      'status': update.status
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return UpdateProfil.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post update');
    }
  }

  Future<UpdateProfil> updateUpdateProfil(
      String id, UpdateProfil update) async {
    Map data = {
      'NIK': update.NIK,
      'nama': update.nama,
      'alamat': update.alamat,
      'email': update.email,
      'tanggal_lahir': update.tanggal_lahir,
      'jenis_kelamin': update.jenis_kelamin,
      'no_telepon': update.no_telepon,
      'password': update.password,
      'foto_profil': update.foto_profil,
      'status': update.status
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return UpdateProfil.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a update');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("UpdateProfil deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
