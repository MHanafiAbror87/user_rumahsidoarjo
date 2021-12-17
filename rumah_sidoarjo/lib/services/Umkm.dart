import 'dart:convert';
import 'package:rumah_sidoarjo/services/Umkm.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:http/http.dart';

class ApiUmkm {
  final String apiUrl =
      "http://10.50.1.53/RumahSidoarjoAdmin/rumahsidoarjo/rest-api/Api_Umkm";

  Future<List<Umkm>> getUmkm() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Umkm> umkm =
          body.map((dynamic item) => Umkm.fromJson(item)).toList();
      return umkm;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Umkm> getUmkmById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Umkm.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a umkm');
    }
  }

  Future<Umkm> createUmkm(Umkm umkm) async {
    Map data = {
      'kategori': umkm.kategori,
      'nama': umkm.nama,
      'alamat': umkm.alamat,
      'penanggung_jawab': umkm.penanggung_jawab,
      'foto1': umkm.foto1,
      'foto2': umkm.foto2,
      'foto3': umkm.foto3,
      'deskripsi': umkm.deskripsi,
      'no_telp': umkm.no_telp,
      'website': umkm.website
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Umkm.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post umkm');
    }
  }

  Future<Umkm> updateUmkm(String id, Umkm umkm) async {
    Map data = {
      'kategori': umkm.kategori,
      'nama': umkm.nama,
      'alamat': umkm.alamat,
      'penanggung_jawab': umkm.penanggung_jawab,
      'foto1': umkm.foto1,
      'foto2': umkm.foto2,
      'foto3': umkm.foto3,
      'deskripsi': umkm.deskripsi,
      'no_telp': umkm.no_telp,
      'website': umkm.website
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Umkm.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a umkm');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Umkm deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
