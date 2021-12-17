import 'package:rumah_sidoarjo/models/login.dart';
import 'package:rumah_sidoarjo/models/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static const isLoginKey = "IS_LOGIN";
  static const nik = "NIK";
  static const nama = "NAMA";
  static const alamat = "ALAMAT";
  static const email = "EMAIL";
  static const tanggalLahir = "TANGGAL_LAHIR";
  static const jenisKelamin = "JENIS_KELAMIN";
  static const noTelepon = "NO_TELEPON";
  static const password = "PASSWORD";
  static const fotoProfil = "FOTO_PROFIL";

  static Future<void> saveLoginSession(DataLogin user) async {
    print('data user: ${user.toString()}');

    final prefs = await SharedPreferences.getInstance();

    prefs.setBool(isLoginKey, true);
    prefs.setString(nik, user.nik);
    prefs.setString(nama, user.nama);
    prefs.setString(alamat, user.alamat);
    prefs.setString(email, user.email);
    prefs.setString(tanggalLahir, user.tanggalLahir!.toIso8601String());
    prefs.setString(jenisKelamin, user.jenisKelamin);
    prefs.setString(noTelepon, user.noTelepon);
    prefs.setString(password, user.password);
    prefs.setString(fotoProfil, user.fotoProfil);
  }

  static Future<void> saveUpdateProfil(DataRegister user) async {
    print('data user: ${user.jenisKelamin}');

    final prefs = await SharedPreferences.getInstance();

    prefs.setString(nama, user.nama);
    prefs.setString(alamat, user.alamat!);
    prefs.setString(tanggalLahir, user.tanggalLahir!);
    prefs.setString(jenisKelamin, user.jenisKelamin);
    prefs.setString(noTelepon, user.noTelepon);
    prefs.setString(password, user.password);
  }

  static Future<void> saveImageProfile(String image) async {
    final prefs = await SharedPreferences.getInstance();
    print('image saved: $image');

    prefs.setString(fotoProfil, image);
  }

  static Future<bool> checkisLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoginKey) ?? false;
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<String> getNik() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(nik) ?? "";
  }

  static Future<String> getNama() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(nama) ?? "";
  }

  static Future<String> getAlamat() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(alamat) ?? "";
  }

  static Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(email) ?? "";
  }

  static Future<String> getTanggalLahir() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(tanggalLahir) ?? "";
  }

  static Future<String> getJenisKelamin() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(jenisKelamin) ?? "";
  }

  static Future<String> getNoTelepon() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(noTelepon) ?? "";
  }

  static Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(password) ?? "";
  }

  static Future<String> getFotoProfil() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(fotoProfil) ?? "";
  }
}
