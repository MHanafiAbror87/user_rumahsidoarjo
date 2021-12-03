import 'dart:convert';
import 'package:rumah_sidoarjo/services/Pariwisata.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:http/http.dart';

class ApiPariwisata {
  final String apiUrl =
      "http://10.50.1.162/RumahSidoarjoAdmin/rumahsidoarjo/rest-api/Api_Pariwisata";

  Future<List<dynamic>> getWisata() async {
    var result = await get(Uri.parse(apiUrl));
    return jsonDecode(result.body);
  }

  Future<List<Pariwisata>> getPariwisata() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pariwisata> wisata =
          body.map((dynamic item) => Pariwisata.fromJson(item)).toList();
      return wisata;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Pariwisata> getPariwisataById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Pariwisata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a wisata');
    }
  }

  Future<Pariwisata> createRegister(Pariwisata wisata) async {
    Map data = {
      'id_kategori_wisata': wisata.id_kategori_wisata,
      'nama_wisata': wisata.nama_wisata,
      'alamat': wisata.alamat,
      'pengelola': wisata.pengelola,
      'no_telepon': wisata.no_telepon,
      'jam_buka': wisata.jam_buka,
      'jam_tutup': wisata.jam_tutup,
      'foto1': wisata.foto1,
      'foto2': wisata.foto2,
      'foto3': wisata.foto3
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Pariwisata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post wisata');
    }
  }

  Future<Pariwisata> updatePariwisata(String id, Pariwisata wisata) async {
    Map data = {
      'id_kategori_wisata': wisata.id_kategori_wisata,
      'nama_wisata': wisata.nama_wisata,
      'alamat': wisata.alamat,
      'pengelola': wisata.pengelola,
      'no_telepon': wisata.no_telepon,
      'jam_buka': wisata.jam_buka,
      'jam_tutup': wisata.jam_tutup,
      'foto1': wisata.foto1,
      'foto2': wisata.foto2,
      'foto3': wisata.foto3
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Pariwisata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a wisata');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Pariwisata deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
