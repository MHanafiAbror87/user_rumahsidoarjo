import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/models/register.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';

enum Gender { male, female }

class AddRegister extends StatefulWidget {
  static String routeName = "/register";
  const AddRegister({Key? key}) : super(key: key);

  @override
  _AddRegisterState createState() => _AddRegisterState();
}

class _AddRegisterState extends State<AddRegister> {
  final ApiServices api = ApiServices();
  final _addFormKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _NIKController = TextEditingController();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _notelpController = TextEditingController();
  final _passwordController = TextEditingController();
  String gender = 'Laki-Laki';
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

    if (_NIKController.text.length < 16) {
      status = false;
      Fluttertoast.showToast(msg: 'Masukkan nik yang valid');
      return false;
    }

    if (!EmailValidator.validate(_emailController.text)) {
      status = false;
      Fluttertoast.showToast(msg: 'Masukkan email yang valid');
      return false;
    }

    if (_syarat == false) {
      status = false;
      Fluttertoast.showToast(msg: 'Harap menyetujui persyaratan');
      return false;
    }
    return status;
  }

  bool _syarat = (false);
  bool _obsecureText = true;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _headerPage(context),
                  _buildNIK(),
                  _buildNamaLengkap(),
                  _buildPasswordTF(),
                  _buildNoTelp(),
                  _buildEmail(),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text('Gender'),
                  ),
                  ListTile(
                    title: const Text('Laki-Laki'),
                    leading: Radio(
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value;
                          gender = 'Laki-Laki';
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Perempuan'),
                    leading: Radio(
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value;
                          gender = 'Perempuan';
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildSKCheckbox(context),
                  _buildDaftarBtn(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: TextButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ),
          ),
        },
      ),
      title: const Text('Form Pendaftaran'),
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
                const SizedBox(height: 39),
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
                              return const LoginPage();
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
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            decoration: kBoxDecorationStyle,
            // height: 45.0,
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
                counterText: '',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: 'NIK',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'NIK Tidak Boleh Kosong';
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
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            decoration: kBoxDecorationStyle,
            // height: 45.0,
            width: double.infinity,
            child: TextFormField(
              controller: _namaController,
              style: TextStyle(
                color: darkGrey,
                letterSpacing: 2,
                fontFamily: 'DMSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: 'Nama Lengkap',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama Lengkap Tidak Boleh Kosong';
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

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            // height: 45,
            width: double.infinity,
            child: TextFormField(
              controller: _passwordController,
              obscureText: _obsecureText,
              style: TextStyle(
                color: darkGrey,
                fontFamily: 'DMSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15, top: 9),
                hintText: 'Password',
                hintStyle: kHintTextStyle,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  child: Icon(
                    _obsecureText ? Icons.visibility_off : Icons.visibility,
                    color: darkGrey,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password Tidak Boleh Kosong';
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

  Widget _buildNoTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: kBoxDecorationStyle,
            // height: 45.0,
            width: double.infinity,
            child: TextFormField(
              controller: _notelpController,
              keyboardType: TextInputType.number,
              maxLength: 13,
              style: TextStyle(
                color: darkGrey,
                fontFamily: 'DMSans',
              ),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: 'No. Telp',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'No Telepon Tidak Boleh Kosong';
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

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            decoration: kBoxDecorationStyle,
            // height: 45.0,
            width: double.infinity,
            child: TextFormField(
              controller: _emailController,
              style: TextStyle(
                color: darkGrey,
                letterSpacing: 2,
                fontFamily: 'DMSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: 'Email',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email Tidak Boleh Kosong';
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

  Widget _buildSKCheckbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
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
                    _syarat = !_syarat;
                  });
                },
              ),
            ),
            Row(
              children: [
                const Text(
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
                    Navigator.push(
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
      onPressed: () async {
        if (validate()) {
          bool registStatus = await api.createRegister(DataRegister(
            nik: _NIKController.text,
            nama: _namaController.text,
            jenisKelamin: gender,
            password: _passwordController.text,
            noTelepon: _notelpController.text,
            email: _emailController.text,
          ));

          if (registStatus) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Sukses'),
                content: const Text('Silahkan Log In'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                      );
                    },
                    child: const Text('Log In'),
                  ),
                ],
              ),
            );
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(12.0),
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
