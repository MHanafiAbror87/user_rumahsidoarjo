import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_layananPublik.dart';
import 'package:rumah_sidoarjo/models/layanan_publik.dart';
import 'package:http/http.dart';

class ApiServices {
  final String apiUrl =
      "http://192.168.128.135/RumahSidoarjoAdmin/rest_ci/index.php/Akun";

  Future<List<LayananPublik>> getLayananPublik() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<LayananPublik> layanan =
          body.map((dynamic item) => LayananPublik.fromJson(item)).toList();
      return layanan;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<LayananPublik> getLayananPublikById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return LayananPublik.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a layanan');
    }
  }

  Future<LayananPublik> createLayananPublik(LayananPublik layanan) async {
    Map data = {
      'id_kategorilayanan': layanan.id_kategorilayanan,
      'nama': layanan.nama,
      'deskripsi': layanan.deskripsi
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return LayananPublik.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post layanan');
    }
  }

  Future<LayananPublik> updateLayananPublik(
      String id, LayananPublik layanan) async {
    Map data = {
      'id_kategorilayanan': layanan.id_kategorilayanan,
      'nama': layanan.nama,
      'deskripsi': layanan.deskripsi
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return LayananPublik.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a layanan');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("LayananPublik deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
