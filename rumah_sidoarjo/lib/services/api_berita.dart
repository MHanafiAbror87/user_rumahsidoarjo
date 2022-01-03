import 'dart:async';
import 'dart:convert';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiBerita {
  final String apiUrl =
      "https://www.sidoarjokab.go.id/frontend/web/additionalComponent/apiSite/api_news.php";

  Future<List<ListBeritaModel>> getBerita() async {
    try {
      Response res =
          await get(Uri.parse(apiUrl)).timeout(Duration(seconds: 100));

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
    } on TimeoutException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
