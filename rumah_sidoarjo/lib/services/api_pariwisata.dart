import 'dart:convert';
import 'dart:io';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/models/list_ulasan.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rumah_sidoarjo/models/list_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiPariwisata {
  final String apiUlasan = "$apiurl/Api_Pariwisata/ulasan";
  final String apiUrl = "$apiurl/Api_Pariwisata";

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

  Future<List<UlasanData>> getUlasan(String id) async {
    try {
      Response res = await get(Uri.parse('$apiUlasan?id_wisata=$id'));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListUlasanModel.fromJson(body);

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

  Future<bool> postUlasan(
      List<File?> foto, String idWisata, String ulasan) async {
    final nik = await SessionHelper.getNik();

    Map<String, String> data = {
      'nik': nik,
      'id_wisata': idWisata,
      'ulasan': ulasan,
    };

    print("post: ${data.toString()}");
    print("post url: ${Uri.parse(apiUrl).toString()}");

    try {
      var request = MultipartRequest('POST', Uri.parse(apiUrl));
      var header = <String, String>{
        'Content-Type': 'multipart/form-data',
      };

      for (var i = 0; i < foto.length; i++) {
        print(foto[i].toString());

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

      print("respon ulasan: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        Fluttertoast.showToast(msg: 'Berhasil upload ulasan');
        return true;
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
      return false;
    }
  }
}
