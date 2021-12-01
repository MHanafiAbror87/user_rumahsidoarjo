import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rumah_sidoarjo/models/register.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';

enum Gender { male, female }

class addRegister extends StatefulWidget {
  static String routeName = "/register";
  addRegister();

  @override
  _addRegisterState createState() => _addRegisterState();
}

class _addRegisterState extends State<addRegister> {
  final ApiServices api = ApiServices();
  final _addFormKey = GlobalKey<FormState>();
  final _NIKController = TextEditingController();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _notelpController = TextEditingController();
  final _passwordController = TextEditingController();
  String gender = 'male';
  Gender? _gender = Gender.male;

  bool validate() {
    bool status = false;
    final form = _addFormKey.currentState;
    form?.save();
    if (form!.validate()) {
      form.save();
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  bool _syarat = (false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(context),
        body: Form(
          key: _addFormKey,
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
                    Text('Gender'),
                    ListTile(
                      title: const Text('Male'),
                      leading: Radio(
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                            gender = 'male';
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Female'),
                      leading: Radio(
                        value: Gender.female,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                            gender = 'female';
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildSKCheckbox(context),
                    _buildDaftarBtn(context),
                  ],
                ),
              ),
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
      title: Text('Form Pendaftaran'),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        style: GoogleFonts.dmSans(
                            color: White,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: kBoxDecorationStyle,
            height: 45.0,
            width: double.infinity,
            child: TextFormField(
              controller: _NIKController,
              keyboardType: TextInputType.number,
              maxLength: 16,
              style: TextStyle(
                color: darkGrey,
                fontFamily: 'DMSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
                hintText: 'NIK',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter full name';
                }
                return null;
              },
              onChanged: (value) {},
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: kBoxDecorationStyle,
            height: 45.0,
            width: double.infinity,
            child: TextField(
              controller: _namaController,
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
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 45,
            width: double.infinity,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(
                color: darkGrey,
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
        ),
      ],
    );
  }

  Widget _buildNoTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: kBoxDecorationStyle,
            height: 45.0,
            width: double.infinity,
            child: TextField(
              controller: _notelpController,
              keyboardType: TextInputType.number,
              maxLength: 13,
              style: TextStyle(
                color: darkGrey,
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
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: kBoxDecorationStyle,
            height: 45.0,
            width: double.infinity,
            child: TextField(
              controller: _emailController,
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
        ),
      ],
    );
  }

  Widget _buildSKCheckbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
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
                  _syarat = !_syarat;
                  setState(() {});
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
              onPressed: () {
                if (gender == 'male') {
                  gender = 'Laki-Laki';
                } else if (gender == 'female') {
                  gender = 'Perempuan';
                }
                if (validate()) {
                  api.createRegister(Register(
                    NIK: _NIKController.text,
                    nama: _namaController.text,
                    jenis_kelamin: gender,
                    password: _passwordController.text,
                    no_telepon: _notelpController.text,
                    email: _emailController.text,
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                }
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      ),
    );
  }
}
