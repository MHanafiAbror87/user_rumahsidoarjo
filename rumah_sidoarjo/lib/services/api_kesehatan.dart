import 'dart:convert';
import 'package:rumah_sidoarjo/services/api_kesehatan.dart';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiKesehatan {
  final String apiUrl = "$apiurl/Api_Kesehatan";

  Future<List<KesehatanData>> getKesehatan() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = KesehatanModel.fromJson(body);

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

  Future<KesehatanData> getKesehatanById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return KesehatanData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a umkm');
    }
  }
}
