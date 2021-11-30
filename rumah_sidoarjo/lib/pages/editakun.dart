import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_template.dart';
import '../home.dart';

class EditAkun extends StatefulWidget {
  const EditAkun({Key? key}) : super(key: key);

  @override
  _EditAkunState createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  bool isObsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            children: [
              _buildTextField('Email', "emailuser@gmail.com", false),
              _buildTextField('Nama Lengkap', "Muhammad Hanafi Abror", false),
              _buildTextField('Tanggal Lahir', "27 Oktober 1999", false),
              _buildTextField('Jenis Kelamin', "Laki-laki", false),
              _buildTextField('Telepon', "081234567891", false),
              _buildTextField('Alamat', "Wonoayu Sidoarjo", false),
              _buildTextField('NIK', "351510121200000001", false),
              _buildTextField('Password', "........", true),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'CANCEL',
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: darkGreen1,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'SIMPAN',
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: White,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: darkGreen1,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  AppBar appBar() {
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
                return Home();
              },
            ),
          ),
        },
      ),
      title: Text('Edit Akun'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: isPasswordTextField ? isObsecurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecurePassword = !isObsecurePassword;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye, color: darkGrey),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
