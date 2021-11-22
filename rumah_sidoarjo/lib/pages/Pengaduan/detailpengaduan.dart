import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/Pengaduan/pengaduan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class DetailPengaduan extends StatefulWidget {
  @override
  _DetailPengaduanState createState() => _DetailPengaduanState();
}

class _DetailPengaduanState extends State<DetailPengaduan> {
  DateTime? _dateTime;

  File? image;

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

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: appBar(context),
        body: Column(
          children: [
            headerPage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 610,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: White),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NIK',
                          style: GoogleFonts.dmSans(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text('35198777899877',
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: darkGreen)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Nama',
                          style: GoogleFonts.dmSans(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text('Muhammad Hanafi Abror',
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: darkGreen)),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Lokasi Kejadian')),
                      SizedBox(height: 10),
                      Text(_dateTime == null
                          ? 'Nothing has been picked yet'
                          : DateFormat.yMEd().format(_dateTime!)),
                      RaisedButton(
                          child: Text('Pick a date'),
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateTime ?? DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2025))
                                .then((date) {
                              setState(() {
                                _dateTime = date;
                              });
                            });
                          }),
                      TextFormField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Deskripsi / Catatan')),
                      SizedBox(height: 10),
                      Text('Bukti Kejadian',
                          style: GoogleFonts.dmSans(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      image != null
                          ? Image.file(image!,
                              width: 120, height: 120, fit: BoxFit.cover)
                          : Image.asset(
                              'assets/images/addcamera.png',
                              width: 120,
                              height: 120,
                            ),
                      RaisedButton(
                        onPressed: () => _pickImage(),
                        child: Text("Masukkan Foto"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: const Text(
                                'Terima Kasih telah melakukan pengaduan'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Pengaduan();
                                      },
                                    ),
                                  ),
                                },
                                child: const Text('Selesai'),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(12.0),
                          width: double.infinity,
                          child: Text(
                            'Kirim',
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
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container headerPage() {
    return Container(
      height: 158,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightGreen, darkGreen1],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Pengaduan',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo adukan kerusakan fasilitas publik di lingkungan Anda agar segera mendapatkan penanganan dari dinas terkait',
                textAlign: TextAlign.justify,
                style: headerSubTextStyle,
              ),
            ),
          ),
        ],
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
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Pengaduan();
        })),
      ),
      title: Text('Form Pengaduan'),
      backgroundColor: darkGreen1,
    );
  }
}
