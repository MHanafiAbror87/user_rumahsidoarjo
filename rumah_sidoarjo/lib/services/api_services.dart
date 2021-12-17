import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/models/login.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';
import 'package:rumah_sidoarjo/models/register.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class ApiServices {
  final String apiUrl_edit = "$apiurl/Akun/edit";
  final String apiUrl = "$apiurl/Akun";
  final String apiUrl_login = "$apiurl/Akun/login";
  final String apiUrl_foto = "$apiurl/Akun/foto";

  Future<bool> updateFoto(File foto) async {
    final nik = await SessionHelper.getNik();

    Map<String, String> data = {
      'NIK': nik,
    };

    print("post: ${data.toString()}");
    print("post url: ${Uri.parse(apiUrl_foto).toString()}");

    try {
      var request = MultipartRequest('POST', Uri.parse(apiUrl_foto));
      var header = <String, String>{
        'Content-Type': 'multipart/form-data',
      };

      request.files.add(
        MultipartFile(
          'foto_profil',
          foto.readAsBytes().asStream(),
          foto.lengthSync(),
          filename: '$nik.jpeg',
          contentType: MediaType('image', 'jpeg'),
        ),
      );
      request.headers.addAll(header);
      request.fields.addAll(data);

      final res = await request.send();
      final response = await Response.fromStream(res);

      final jsonResponse = json.decode(response.body);

      print("respon profile: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        SessionHelper.saveImageProfile(jsonResponse['data']['foto_profil']);

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

  Future<bool> postUlasan(List<File> foto, int idUser, String ulasan) async {
    final nik = await SessionHelper.getNik();

    Map<String, String> data = {
      'NIK': nik,
    };

    print("post: ${data.toString()}");
    print("post url: ${Uri.parse(apiUrl_foto).toString()}");

    try {
      var request = MultipartRequest('POST', Uri.parse(apiUrl_foto));
      var header = <String, String>{
        'Content-Type': 'multipart/form-data',
      };

      for (var i = 0; i < foto.length; i++) {
        request.files.add(
          MultipartFile(
            'foto${i + 1}',
            foto[i].readAsBytes().asStream(),
            foto[i].lengthSync(),
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

      print("respon profile: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        SessionHelper.saveImageProfile(jsonResponse['data']['foto_profil']);

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

  Future<bool> login(String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };

    print("post: ${data.toString()}");

    try {
      final Response response = await post(
        Uri.parse(apiUrl_login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final jsonResponse = json.decode(response.body);

      print("respon login: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        final datalogin = LoginModel.fromJson(jsonResponse);
        SessionHelper.saveLoginSession(datalogin.data);
        // Fluttertoast.showToast(msg: jsonResponse['message']);

        return true;
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }

  Future<bool> createRegister(DataRegister register) async {
    Map data = {
      'NIK': register.nik,
      'nama': register.nama,
      'alamat': register.alamat,
      'email': register.email,
      'tanggal_lahir': register.tanggalLahir,
      'jenis_kelamin': register.jenisKelamin,
      'no_telepon': register.noTelepon,
      'password': register.password,
      // 'foto_profil': register.foto_profil,
      // 'status': register.status
    };

    print("post: ${data.toString()}");

    try {
      final Response response = await post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final jsonResponse = json.decode(response.body);

      print("respon register: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        return true;
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }

  Future<bool> updateAkun(DataRegister register) async {
    Map data = {
      'nama': register.nama,
      'alamat': register.alamat,
      'tanggal_lahir': register.tanggalLahir!.trim(),
      'jenis_kelamin': register.jenisKelamin,
      'no_telepon': register.noTelepon,
      'password': register.password,
      'NIK': register.nik,
      // 'foto_profil': register.foto_profil,
      // 'status': register.status
    };

    print("post: ${data.toString()}");
    // return false;

    try {
      final Response response = await post(
        Uri.parse(apiUrl_edit),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final jsonResponse = json.decode(response.body);

      print("respon register: ${jsonResponse.toString()}");

      if (jsonResponse['status'] as bool) {
        SessionHelper.saveUpdateProfil(register);
        return true;
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}
