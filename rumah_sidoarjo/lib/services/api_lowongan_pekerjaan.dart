import 'dart:convert';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/models/lowongan_pekerjaan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiLowonganPekerjaan {
  final String apiUrl = "$apiurl/Api_Lowongan_Pekerjaan";

  Future<List<LowonganPekerjaanData>> getLowongan() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = LowonganPekerjaanModel.fromJson(body);

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
}
