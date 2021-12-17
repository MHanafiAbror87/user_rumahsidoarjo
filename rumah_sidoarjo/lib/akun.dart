import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/pages/editakun.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'custom_template.dart';
import 'package:path/path.dart' as pt;

class Akun extends StatefulWidget {
  static String routeName = '/akun';
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  ApiServices api = ApiServices();
  File? fotoProfil;
  String profileUrl = '';

  Future<File?> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) {
        fotoProfil = File('null');
        return null;
      }

      File? imageTemp;

      if (source == ImageSource.camera) {
        imageTemp = await saveImagePermanently(image.path);
      } else {
        imageTemp = File(image.path);
      }

      return imageTemp;
    } on PlatformException catch (e) {
      print('failed pick image: ${e.toString()}');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationSupportDirectory();
    final name = pt.basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  void init() async {
    profileUrl = await SessionHelper.getFotoProfil();

    setState(() {
      profileUrl = profileUrl;
    });

    print('profile: $profileUrl');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: White,
        appBar: _appBar(),
        body: ListView(
          children: [
            _akunimage(),
            SizedBox(height: 50),
            _buildInformasiAkun(),
            SizedBox(height: 50),
            _buildLogoutBtn(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: FlatButton(
          onPressed: () => {Navigator.pop(context)},
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          )),
      title: Text('Informasi Akun'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _akunimage() {
    return Container(
      color: White,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    final defaultContext = context;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () async {
                            final image = await pickImage(ImageSource.gallery);

                            if (image != null) {
                              Get.dialog(
                                const Center(
                                    child: CircularProgressIndicator()),
                                barrierDismissible: false,
                              );

                              final status = await api.updateFoto(image);

                              Get.back();
                              Get.back();

                              // Navigator.pop(defaultContext);

                              // Navigator.pop(defaultContext);

                              if (status) {
                                setState(() {
                                  fotoProfil = image;
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Gagal merubah foto profil');
                              }
                            }
                          },
                          title: const Text(
                            'Ambil dari galeri',
                            style: TextStyle(fontFamily: 'poppins'),
                          ),
                          leading: const Icon(Icons.image),
                        ),
                        ListTile(
                          onTap: () async {
                            final image = await pickImage(ImageSource.camera);

                            if (image != null) {
                              Get.dialog(
                                const Center(
                                    child: CircularProgressIndicator()),
                                barrierDismissible: false,
                              );

                              final status = await api.updateFoto(image);

                              Get.back();
                              Get.back();

                              // Navigator.pop(defaultContext);

                              // Navigator.pop(defaultContext);

                              if (status) {
                                setState(() {
                                  fotoProfil = image;
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Gagal merubah foto profil');
                              }
                            }
                          },
                          title: const Text(
                            'Ambil dari kamera',
                            style: TextStyle(fontFamily: 'poppins'),
                          ),
                          leading: const Icon(Icons.camera_alt),
                        ),
                      ],
                    );
                  });
            },
            child: SizedBox(
              height: 130,
              width: 130,
              child: Stack(
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 130,
                      width: 130,
                      child: Builder(
                        builder: (context) {
                          if (fotoProfil == null && profileUrl.isEmpty) {
                            return Image.asset(
                              "assets/images/no_imageakun.png",
                              fit: BoxFit.cover,
                            );
                          } else {
                            print('image url: $apiurl/assets/img/$profileUrl');

                            if (fotoProfil != null) {
                              return Image.file(fotoProfil!, fit: BoxFit.cover);
                            }

                            return Image.network(
                              "$fotoUrl/assets/img/$profileUrl",
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipOval(
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.white,
                        child: const Icon(Icons.camera_alt),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _tbGantiFoto()
        ],
      ),
    );
  }

  TextButton _tbGantiFoto() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Ganti Foto',
        style: TextStyle(
          color: darkGreen1,
          fontSize: 16,
          fontFamily: 'DMSans',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInformasiAkun() {
    return Container(
      color: White,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      namaAkun(),
                      tbUbah(),
                    ],
                  ),
                ),
                _space(),
                SizedBox(height: 15),
                email(),
                _space(),
                SizedBox(height: 15),
                tanggalLahir(),
                _space(),
                SizedBox(height: 15),
                noTelp(),
                _space(),
                SizedBox(height: 15),
                nik(),
                _space(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column nik() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'NIK',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        FutureBuilder<String>(
            future: SessionHelper.getNik(),
            builder: (context, snapshot) {
              String nik = '-';

              if (snapshot.connectionState == ConnectionState.waiting) {
                nik = '-';
              }

              if (snapshot.hasData) {
                nik = snapshot.data!;
              } else {
                nik = '-';
              }
              return Text(
                nik,
                style: TextStyle(
                  fontFamily: "DMSans",
                  color: lightGrey,
                  fontSize: 16,
                ),
              );
            })
      ],
    );
  }

  Column noTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'No. Telp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        FutureBuilder<String>(
            future: SessionHelper.getNoTelepon(),
            builder: (context, snapshot) {
              String notelepon = '-';

              if (snapshot.connectionState == ConnectionState.waiting) {
                notelepon = '-';
              }

              if (snapshot.hasData) {
                notelepon = snapshot.data!;
              } else {
                notelepon = '-';
              }
              return Text(
                notelepon,
                style: TextStyle(
                  fontFamily: "DMSans",
                  color: lightGrey,
                  fontSize: 16,
                ),
              );
            })
      ],
    );
  }

  Column tanggalLahir() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tanggal Lahir',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        FutureBuilder<String>(
            future: SessionHelper.getTanggalLahir(),
            builder: (context, snapshot) {
              String tanggallahir = '-';

              if (snapshot.connectionState == ConnectionState.waiting) {
                tanggallahir = '-';
              }

              if (snapshot.hasData) {
                tanggallahir = snapshot.data!;
              } else {
                tanggallahir = '-';
              }
              return Text(
                tanggallahir,
                style: TextStyle(
                  fontFamily: "DMSans",
                  color: lightGrey,
                  fontSize: 16,
                ),
              );
            })
      ],
    );
  }

  TextButton tbUbah() {
    return TextButton(
      onPressed: () => {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const EditAkun();
        }))
      },
      child: Text(
        'Ubah',
        style: TextStyle(
          color: darkGreen1,
          fontSize: 16,
          fontFamily: 'DMSans',
        ),
      ),
    );
  }

  Padding namaAkun() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nama Akun',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "DMSans",
              fontSize: 16,
            ),
          ),
          FutureBuilder<String>(
              future: SessionHelper.getNama(),
              builder: (context, snapshot) {
                String nama = '-';

                if (snapshot.connectionState == ConnectionState.waiting) {
                  nama = '-';
                }

                if (snapshot.hasData) {
                  nama = snapshot.data!;
                } else {
                  nama = '-';
                }
                return Text(
                  nama,
                  style: TextStyle(
                    fontFamily: "DMSans",
                    color: lightGrey,
                    fontSize: 16,
                  ),
                );
              })
        ],
      ),
    );
  }

  Column email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        FutureBuilder<String>(
            future: SessionHelper.getEmail(),
            builder: (context, snapshot) {
              String email = '-';

              if (snapshot.connectionState == ConnectionState.waiting) {
                email = '-';
              }

              if (snapshot.hasData) {
                email = snapshot.data!;
              } else {
                email = '-';
              }
              return Text(
                email,
                style: TextStyle(
                  fontFamily: "DMSans",
                  color: lightGrey,
                  fontSize: 16,
                ),
              );
            })
      ],
    );
  }

  Widget _space() {
    return Container(
      height: 2,
      width: double.infinity,
      color: Color(0xffeeeeee),
    );
  }

  Widget _buildLogoutBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RaisedButton(
            elevation: 4.0,
            onPressed: () async {
              await SessionHelper.clearSession();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            padding: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: White),
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.red.shade600,
            child: Text(
              'LOG OUT',
              style: TextStyle(
                color: White,
                letterSpacing: 2,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
