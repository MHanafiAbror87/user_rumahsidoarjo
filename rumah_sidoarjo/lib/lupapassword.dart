import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';
import 'custom_template.dart';

class LupaPassword extends StatefulWidget {
  static String routeName = "/lupapassword";
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  final ApiServices api = ApiServices();
  final _addFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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

    if (!EmailValidator.validate(_emailController.text)) {
      status = false;
      Fluttertoast.showToast(msg: 'Masukkan email yang valid');
      return false;
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Form(
        key: _addFormKey,
        child: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    _headerPage(),
                    _buildEmail(),
                    SizedBox(
                      height: 30,
                    ),
                    _buildKirimBtn(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: FlatButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onPressed: () => {
          Navigator.pop(
            context,
          ),
        },
      ),
      title: Text('Lupa Password'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [lightGreen, darkGreen1],
            end: Alignment.centerRight,
            begin: Alignment.centerLeft),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: <Widget>[
          // SizedBox(height: 19),
          Column(
            children: [
              SizedBox(height: 30),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans',
                        ),
                      ),
                      Text(
                        'Silahkan masukkan email Anda untuk mendapatkan tautan atur ulang password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: White,
                          fontFamily: 'DMSans',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: kBoxDecorationStyle,
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
                contentPadding: EdgeInsets.only(left: 15),
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

  Widget _buildKirimBtn(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (validate()) {
          bool registStatus = await api.lupapassword(
            _emailController.text,
          );

          if (registStatus) {
            Fluttertoast.showToast(msg: "Silahkan Cek Email Anda");
            Navigator.pop(context);
            // showDialog<String>(
            //   context: context,
            //   builder: (BuildContext context) => AlertDialog(
            //     title: const Text('Sukses'),
            //     content: const Text('Silahkan Cek Email Anda'),
            //     actions: <Widget>[
            //       TextButton(
            //         onPressed: () {
            //           Navigator.pop(
            //             context,
            //           );
            //         },
            //         child: const Text('Log In'),
            //       ),
            //     ],
            //   ),
            // );
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          // height: 50,
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Text(
            'Kirim',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: White),
          ),
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
      // const Text(
      //   'Kirim',
      //   style: TextStyle(fontSize: 20),
      // ),
    );
  }
}
