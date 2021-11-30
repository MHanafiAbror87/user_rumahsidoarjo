import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_pendidikan.dart';
import 'package:rumah_sidoarjo/models/pendidikan.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.128.135/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<Pendidikan>> getPendidikan() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pendidikan> sekolah =
          body.map((dynamic item) => Pendidikan.fromJson(item)).toList();
      return sekolah;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Pendidikan> getPendidikanById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Pendidikan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a sekolah');
    }
  }

  Future<Pendidikan> createPendidikan(Pendidikan sekolah) async {
    Map data = {
      'id_kelurahan': sekolah.id_kelurahan,
      'nama_sekolah': sekolah.nama_sekolah,
      'alamat': sekolah.alamat,
      'akreditasi': sekolah.akreditasi,
      'NPSN': sekolah.NPSN,
      'no_telepon': sekolah.no_telepon,
      'jenjang': sekolah.jenjang,
      'status': sekolah.status,
      'website': sekolah.website
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Pendidikan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post sekolah');
    }
  }

  Future<Pendidikan> updatePendidikan(String id, Pendidikan sekolah) async {
    Map data = {
      'id_kelurahan': sekolah.id_kelurahan,
      'nama_sekolah': sekolah.nama_sekolah,
      'alamat': sekolah.alamat,
      'akreditasi': sekolah.akreditasi,
      'NPSN': sekolah.NPSN,
      'no_telepon': sekolah.no_telepon,
      'jenjang': sekolah.jenjang,
      'status': sekolah.status,
      'website': sekolah.website
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Pendidikan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a sekolah');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Pendidikan deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
