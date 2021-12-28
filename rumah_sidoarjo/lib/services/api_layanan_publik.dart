import 'dart:convert';
import 'package:rumah_sidoarjo/models/kategori_layanan_publik.dart';
import 'package:rumah_sidoarjo/models/layanan_publik.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiLayananPublik {
  final String apiUrl = "$apiurl/Api_Layanan_Publik";
  final String apiUrlKategori =
      "$apiurl/Api_Layanan_Publik/layananpublikkategori";
  final String apiUrlLayanan = "$apiurl/Api_Layanan_Publik/layananpublik";

  Future<List<KategoriLayananData>> getKategori() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = KategoriLayananPublikModel.fromJson(body);

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

  Future<List<LayananPublikData>> getKategoriById(String id) async {
    try {
      Response res =
          await get(Uri.parse('$apiUrlKategori?id_kategorilayanan=$id'));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = LayananPublikModel.fromJson(body);

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

  Future<List<LayananPublikData>> getLayananPublikById(String id) async {
    try {
      Response res = await get(Uri.parse('$apiUrlLayanan?id_layanan=$id'));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = LayananPublikModel.fromJson(body);

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
