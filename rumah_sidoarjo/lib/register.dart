import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Register extends StatefulWidget {
  static String routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File? image;
  File? images;

  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future _pickImages() async {
    try {
      final images = await ImagePicker().pickImage(source: ImageSource.camera);
      if (images == null) return;

      // final imageTemporary = File(image.path);
      final imagesPermanent = await saveImagePermanently(images.path);
      setState(() => this.images = imagesPermanent);
    } on PlatformException catch (e) {
      print('Failed to pick images: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future<File> saveImagesPermanently(String imagesPath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagesPath);
    final images = File('${directory.path}/$name');

    return File(imagesPath).copy(images.path);
  }

  bool _syarat = (false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(context),
        body: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    _headerPage(context),
                    _buildNIK(),
                    _buildNamaLengkap(),
                    _buildPasswordTF(),
                    _buildNoTelp(),
                    _buildEmail(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Unggah Foto KTP', style: uploadText),
                                image != null
                                    ? Image.file(image!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover)
                                    : Image.asset(
                                        'assets/images/Kesehatan.png',
                                        width: 120,
                                        height: 120,
                                      ),
                                RaisedButton(
                                  onPressed: () => _pickImage(),
                                  child: Text("Masukkan Foto"),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Selfie Dengan KTP', style: uploadText),
                                images != null
                                    ? Image.file(images!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover)
                                    : Image.asset(
                                        'assets/images/Kesehatan.png',
                                        width: 120,
                                        height: 120,
                                      ),
                                RaisedButton(
                                  onPressed: () => _pickImages(),
                                  child: Text("Masukkan Foto"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildSKCheckbox(context),
                    _buildDaftarBtn(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: FlatButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          ),
        },
      ),
      title: Center(
        child: Text('Form Pendaftaran'),
      ),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage(BuildContext context) {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Stack(
        children: <Widget>[
          // SizedBox(height: 19),
          Center(
            child: Column(
              children: [
                SizedBox(height: 39),
                Text(
                  'Daftar Akun Baru',
                  style: headerTextStyle,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 85,
                      ),
                    ),
                    Text(
                      'Sudah memiliki akun?',
                      style: headerSubTextStyle,
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        ),
                      },
                      // padding: EdgeInsets.only(left: 95, right: 0.0),
                      child: Text(
                        'Log In',
                        style: headerSubTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNIK() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 45.0,
            width: double.infinity,
            child: TextField(
              style: TextStyle(
                color: darkGrey,
                letterSpacing: 2,
                fontFamily: 'DMSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
                hintText: 'NIK',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNamaLengkap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'Nama Lengkap',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45,
          width: 390,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15, top: 9),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: darkGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'No. Telp',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSKCheckbox(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: lightGrey),
            child: Checkbox(
              value: _syarat,
              checkColor: White,
              activeColor: darkGreen,
              onChanged: (value) {
                setState(() {
                  _syarat = true;
                });
              },
            ),
          ),
          Row(
            children: [
              Text(
                'Setujui',
                style: TextStyle(
                  color: Color(0xffA6A6A6),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: 'DMSans',
                ),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Syarat();
                      },
                    ),
                  ),
                },
                // padding: EdgeInsets.only(left: 95, right: 0.0),
                child: Text(
                  'Syarat & Ketentuan',
                  style: TextStyle(
                    fontSize: 13,
                    color: darkGreen,
                    fontFamily: 'DMSans',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDaftarBtn(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Sukses'),
          content: const Text('Silahkan Log In'),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                ),
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
        child: Text(
          'Daftar',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: White,
            letterSpacing: 2,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
