import 'dart:convert';
import 'dart:io';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/models/list_sekolah.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rumah_sidoarjo/models/list_pariwisata.dart';
import 'package:rumah_sidoarjo/models/pendidikan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiSekolah {
  final String apiUrl = "$apiurl/Api_Sekolah";
  final String apiUrlSlb = "$apiurl/Api_Sekolah/slb";
  final String apiUrlSmp = "$apiurl/Api_Sekolah/smp";

  Future<List<SekolahData>> getSekolah() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListSekolahModel.fromJson(body);

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

  Future<List<SekolahData>> getSlb() async {
    try {
      Response res = await get(Uri.parse(apiUrlSlb));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListSekolahModel.fromJson(body);

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

  Future<List<SekolahData>> getSmp() async {
    try {
      Response res = await get(Uri.parse(apiUrlSmp));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListSekolahModel.fromJson(body);

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

  Future<DetailSekolahModel> getSdById(String id) async {
    final response = await get(Uri.parse('$apiUrl?id_sekolah=$id'));

    if (response.statusCode == 200) {
      return DetailSekolahModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a sekolah');
    }
  }

  Future<DetailSekolahModel> getSlbById(String id) async {
    final response = await get(Uri.parse('$apiUrlSlb?id_sekolah=$id'));

    if (response.statusCode == 200) {
      return DetailSekolahModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a sekolah');
    }
  }

  Future<DetailSekolahModel> getSmpById(String id) async {
    final response = await get(Uri.parse('$apiUrlSmp?id_sekolah=$id'));

    if (response.statusCode == 200) {
      return DetailSekolahModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a sekolah');
    }
  }
}
