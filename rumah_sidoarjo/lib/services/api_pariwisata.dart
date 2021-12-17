import 'dart:convert';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/detailpariwisata.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/list_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiPariwisata {
  final String apiUrl = "$apiurl/Api_Pariwisata";

  // Future<List<dynamic>> getWisata() async {
  //   var result = await get(Uri.parse(apiUrl));
  //   return jsonDecode(result.body);
  // }

  Future<List<PariwisataData>> getPariwisata() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListPariwisataModel.fromJson(body);

          return response.data;
        } else {
          throw body['message'];
        }
      } else {
        throw "Failed to load cases list";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<DetailPariwisataModel> getPariwisataById(String id) async {
    final response = await get(Uri.parse('$apiUrl?id_wisata=$id'));

    if (response.statusCode == 200) {
      return DetailPariwisataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a wisata');
    }
  }

  Future<Pariwisata> createRegister(Pariwisata wisata) async {
    Map data = {
      'id_kategori_wisata': wisata.idKategoriWisata,
      'nama_wisata': wisata.namaWisata,
      'alamat': wisata.alamat,
      'pengelola': wisata.pengelola,
      'no_telepon': wisata.noTelepon,
      'jam_buka': wisata.jamBuka,
      'jam_tutup': wisata.jamTutup,
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
      'id_kategori_wisata': wisata.idKategoriWisata,
      'nama_wisata': wisata.namaWisata,
      'alamat': wisata.alamat,
      'pengelola': wisata.pengelola,
      'no_telepon': wisata.noTelepon,
      'jam_buka': wisata.jamBuka,
      'jam_tutup': wisata.jamTutup,
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
