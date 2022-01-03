import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/lupapassword.dart';
import 'package:rumah_sidoarjo/addregister.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiServices api = ApiServices();
  final _addFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = (false);
  bool _obsecureText = true;

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

  get color => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: WillPopScope(
        //tombol back manual
        onWillPop: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Home();
              },
            ),
          );

          return false;
        },
        child: Form(
          key: _addFormKey,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _icLogin(),
                          const SizedBox(height: 33.0),
                          _buildEmail(),
                          _buildPasswordTF(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildRememberMeCheckbox(),
                              _buildLupaPasswordBtn(),
                            ],
                          ),
                          _buildLoginBtn(),
                          const SizedBox(
                            height: 50.0,
                          ),
                          _buildtextdaftar(),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildDaftarBtn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _icLogin() {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/logo_sidoarjo.png',
          width: 104,
          height: 97,
        ),
        Text(
          'RUMAH SIDOARJO',
          style: GoogleFonts.bebasNeue(
            fontSize: 24,
            color: darkGreen,
            letterSpacing: 3,
          ),
        ),
        Text(
          'Informasi Seputar Kabupaten Sidoarjo',
          style: GoogleFonts.aBeeZee(
            fontSize: 12,
            color: const Color(0xff8F8E8E),
          ),
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: _emailController,
            style: TextStyle(
              color: darkGrey,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
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
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: _passwordController,
            obscureText: _obsecureText,
            style: TextStyle(
              color: darkGrey,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
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
      ],
    );
  }

  Widget _buildLupaPasswordBtn() {
    return TextButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LupaPassword();
            },
          ),
        ),
      },
      // padding: EdgeInsets.only(left: 95, right: 0.0),
      child: Text(
        'Lupa Password?',
        style: TextStyle(
          color: darkOrange,
          fontFamily: 'DMSans',
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: lightGrey),
            child: Checkbox(
              value: _rememberMe,
              checkColor: White,
              activeColor: darkGreen,
              onChanged: (value) {
                _rememberMe = !_rememberMe;
                setState(() {});
              },
            ),
          ),
          const Text(
            'Ingat Saya',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontWeight: FontWeight.bold,
              fontFamily: 'DMSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (validate()) {
            bool registStatus = await api.login(
              _emailController.text,
              _passwordController.text,
            );

            if (registStatus) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Home();
                  },
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: White,
            letterSpacing: 2,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }

  Widget _buildDaftarBtn() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddRegister();
              },
            ),
          ),
        },
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        color: White,
        child: Text(
          'Daftar',
          style: TextStyle(
            color: lightGreen,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }

  Widget _buildtextdaftar() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
        ),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Belum punya akun? ',
                style: TextStyle(
                  color: Color(0xffA6A6A6),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
