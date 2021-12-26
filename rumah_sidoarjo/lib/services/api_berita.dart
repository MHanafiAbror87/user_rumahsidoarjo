import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:rumah_sidoarjo/models/list_ulasan_umkm.dart';
import 'package:rumah_sidoarjo/models/list_umkm.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:http_parser/http_parser.dart';

class ApiBerita {
  final String apiUrlMakanan = "$apiurl/Api_Umkm/makanan";
  final String apiUrlPertanian = "$apiurl/Api_Umkm/pertanian";
  final String apiUrl =
      "https://www.sidoarjokab.go.id/frontend/web/additionalComponent/apiSite/api_news.php";
  final String apiUlasan = "$apiurl/Api_Umkm/ulasan";

  Future<List<ListBeritaModel>> getBerita() async {
    try {
      Response res =
          await get(Uri.parse(apiUrl)).timeout(Duration(seconds: 1000));

      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);

        List<ListBeritaModel> berita = body
            .map(
              (dynamic item) => ListBeritaModel.fromJson(item),
            )
            .toList();

        return berita;
      } else {
        throw "Failed to load cases list";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<UmkmData>> getUmkmMakanan() async {
    try {
      Response res = await get(Uri.parse(apiUrlMakanan));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListUmkmModel.fromJson(body);

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

  Future<List<UmkmData>> getUmkm() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListUmkmModel.fromJson(body);

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

  Future<DetailUmkmModel> getUmkmByIdPertanian(String id) async {
    final response = await get(Uri.parse('$apiUrlPertanian?id_umkm=$id'));

    if (response.statusCode == 200) {
      return DetailUmkmModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a umkm');
    }
  }

  Future<DetailUmkmModel> getUmkmByIdMakanan(String id) async {
    final response = await get(Uri.parse('$apiUrlMakanan?id_umkm=$id'));

    if (response.statusCode == 200) {
      return DetailUmkmModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a umkm');
    }
  }

  Future<DetailUmkmModel> getUmkmById(String id) async {
    final response = await get(Uri.parse('$apiUrl?id_umkm=$id'));

    if (response.statusCode == 200) {
      return DetailUmkmModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a umkm');
    }
  }

  Future<List<UlasanDataUmkm>> getUlasan(String id) async {
    try {
      Response res = await get(Uri.parse('$apiUlasan?id_umkm=$id'));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListUlasanUmkmModel.fromJson(body);

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

  Future<bool> postUlasanUmkm(
      List<File?> foto, String idUmkm, String ulasan) async {
    final nik = await SessionHelper.getNik();

    Map<String, String> data = {
      'NIK': nik,
      'id_umkm': idUmkm,
      'ulasan': ulasan,
    };

    try {
      var request = MultipartRequest('POST', Uri.parse(apiUrl));
      var header = <String, String>{
        'Content-Type': 'multipart/form-data',
      };

      for (var i = 0; i < foto.length; i++) {
        // print(foto[i].toString());

        if (foto[i] == null) {
          continue;
        }

        request.files.add(
          MultipartFile(
            'foto${i + 1}',
            foto[i]!.readAsBytes().asStream(),
            foto[i]!.lengthSync(),
            filename: '$nik.jpeg',
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      }

      request.headers.addAll(header);
      request.fields.addAll(data);

      final res = await request.send();
      final response = await Response.fromStream(res);

      final jsonResponse = json.decode(response.body);

      // print("respon ulasan: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        Fluttertoast.showToast(msg: 'Berhasil upload ulasan');
        return true;
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      // print(e.toString());
      return false;
    }
  }
}
