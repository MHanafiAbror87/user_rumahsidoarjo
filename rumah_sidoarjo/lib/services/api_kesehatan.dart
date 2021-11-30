import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_kesehatan.dart';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.128.135/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<Kesehatan>> getKesehatan() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Kesehatan> kesehatan =
          body.map((dynamic item) => Kesehatan.fromJson(item)).toList();
      return kesehatan;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Kesehatan> getKesehatanById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Kesehatan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a kesehatan');
    }
  }

  Future<Kesehatan> createKesehatan(Kesehatan kesehatan) async {
    Map data = {
      'id_kecamatan': kesehatan.id_kecamatan,
      'nama': kesehatan.nama,
      'alamat': kesehatan.alamat,
      'kepemilikan': kesehatan.kepemilikan,
      'kategori': kesehatan.kategori,
      'no_telepon': kesehatan.no_telepon,
      'fax': kesehatan.fax,
      'email': kesehatan.email,
      'website': kesehatan.website,
      'penanggung_jawab': kesehatan.penanggung_jawab,
      'foto': kesehatan.foto
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Kesehatan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post kesehatan');
    }
  }

  Future<Kesehatan> updateKesehatan(String id, Kesehatan kesehatan) async {
    Map data = {
      'id_kecamatan': kesehatan.id_kecamatan,
      'nama': kesehatan.nama,
      'alamat': kesehatan.alamat,
      'kepemilikan': kesehatan.kepemilikan,
      'kategori': kesehatan.kategori,
      'no_telepon': kesehatan.no_telepon,
      'fax': kesehatan.fax,
      'email': kesehatan.email,
      'website': kesehatan.website,
      'penanggung_jawab': kesehatan.penanggung_jawab,
      'foto': kesehatan.foto
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Kesehatan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a kesehatan');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Kesehatan deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
