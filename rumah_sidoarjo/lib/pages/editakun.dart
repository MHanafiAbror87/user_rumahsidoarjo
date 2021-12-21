import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/akun.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/models/register.dart';
import 'package:rumah_sidoarjo/services/api_services.dart';
import '../custom_template.dart';

class EditAkun extends StatefulWidget {
  const EditAkun({Key? key}) : super(key: key);

  @override
  _EditAkunState createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  final ApiServices api = ApiServices();
  final _addFormKey = GlobalKey<FormState>();
  final _nikController = TextEditingController();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _tanggallahirController = TextEditingController();
  final _jeniskelaminController = TextEditingController();
  final _teleponController = TextEditingController();
  final _alamatController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObsecurePassword = true;

  DateTime selectedTime = DateTime.now();
  String selectedJk = 'Laki-Laki';

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
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  void init() async {
    _nikController.text = await SessionHelper.getNik();
    _namaController.text = await SessionHelper.getNama();
    _emailController.text = await SessionHelper.getEmail();

    _jeniskelaminController.text = await SessionHelper.getJenisKelamin();

    _teleponController.text = await SessionHelper.getNoTelepon();
    _alamatController.text = await SessionHelper.getAlamat();

    final tglLahir = DateTime.parse(await SessionHelper.getTanggalLahir());

    setState(() {
      selectedJk = _jeniskelaminController.text;
      selectedTime = tglLahir;
    });

    _tanggallahirController.text = DateFormat('dd/MM/yyyy').format(tglLahir);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Form(
        key: _addFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            children: [
              _buildTextField('Nama Lengkap', "Masukkan Nama Lengkap", false,
                  _namaController),
              GestureDetector(
                onTap: () async {
                  DateTime? selected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900, 1),
                    lastDate: DateTime.now(),
                  );

                  print('selected date: ${selected.toString()}');
                  print(
                      'selected date: ${DateFormat("yyyy-MM-dd").format(selected!)}');

                  if (selected != null) {
                    setState(() {
                      selectedTime = selected;
                    });

                    _tanggallahirController.text =
                        DateFormat('dd/MM/yyyy').format(selected);
                  }
                },
                child: _buildTextField('Tanggal Lahir', "dd/mm/yyyy", false,
                    _tanggallahirController, false),
              ),
              _pilihJenisKelamin(),
              _buildTextField(
                  'Telepon', "Masukkan No Telepon", false, _teleponController),
              _buildTextField(
                  'Alamat', "Masukkan Alamat", false, _alamatController),
              _buildTextField('Password', "Kosongkan jika tidak ingin mengubah",
                  true, _passwordController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () => {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Akun();
                          },
                        ),
                      )
                    },
                    child: Text(
                      'CANCEL',
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: darkGreen1,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (validate()) {
                        bool registStatus = await api.updateAkun(DataRegister(
                          nik: _nikController.text,
                          nama: _namaController.text,
                          tanggalLahir:
                              DateFormat('yyyy-MM-dd').format(selectedTime),
                          jenisKelamin: selectedJk,
                          password: _passwordController.text,
                          noTelepon: _teleponController.text,
                          email: '',
                          alamat: _alamatController.text,
                        ));

                        if (registStatus) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Akun();
                              },
                            ),
                          );
                        }
                      }
                    },
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: TextButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onPressed: () => {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Akun();
              },
            ),
          ),
        },
      ),
      title: Text('Edit Akun'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller,
      [bool isenabled = true]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: isenabled,
        controller: controller,
        obscureText: isPasswordTextField ? isObsecurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecurePassword = !isObsecurePassword;
                    });
                  },
                  icon: Icon(
                      isObsecurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: darkGrey),
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

  Padding _pilihJenisKelamin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jenis Kelamin',
            style: GoogleFonts.dmSans(color: darkGrey, fontSize: 12),
          ),
          DropdownButton<String>(
            isExpanded: true,
            value: selectedJk,
            onChanged: (selected) {
              setState(() {
                selectedJk = selected!;
              });
            },
            items: const [
              DropdownMenuItem(
                value: 'Laki-Laki',
                child: Text('Laki-Laki'),
              ),
              DropdownMenuItem(
                value: 'Perempuan',
                child: Text('Perempuan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
