import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_lowonganKerja.dart';
import 'package:rumah_sidoarjo/models/lowongan_kerja.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.128.135/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<Loker>> getLoker() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Loker> lowongan =
          body.map((dynamic item) => Loker.fromJson(item)).toList();
      return lowongan;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Loker> getLokerById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Loker.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a lowongan');
    }
  }

  Future<Loker> createLoker(Loker lowongan) async {
    Map data = {
      'id': lowongan.id,
      'judul_lowongan': lowongan.judul_lowongan,
      'deskripsi_pekerjaan': lowongan.deskripsi_pekerjaan,
      'foto_lowongan': lowongan.foto_lowongan,
      'file': lowongan.file
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Loker.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post lowongan');
    }
  }

  Future<Loker> updateLoker(String id, Loker lowongan) async {
    Map data = {
      'id': lowongan.id,
      'judul_lowongan': lowongan.judul_lowongan,
      'deskripsi_pekerjaan': lowongan.deskripsi_pekerjaan,
      'foto_lowongan': lowongan.foto_lowongan,
      'file': lowongan.file
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Loker.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a lowongan');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Lowongan deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
