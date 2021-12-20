import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_umkm.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiUmkm {
  final String apiUrl = "$apiurl/Api_Umkm";

  Future<List<UmkmModel>> getUmkm() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = Umkm.fromJson(body);

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

  Future<UmkmModel> getUmkmById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return UmkmModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a umkm');
    }
  }
}
