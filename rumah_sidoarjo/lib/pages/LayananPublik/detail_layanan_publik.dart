import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/kategori_layanan_publik.dart';
import 'package:rumah_sidoarjo/models/layanan_publik.dart';
import 'package:rumah_sidoarjo/pages/LayananPublik/kategori_layanan_publik.dart';
import 'package:rumah_sidoarjo/pages/LayananPublik/layananpublik.dart';
import 'package:rumah_sidoarjo/services/api_layanan_publik.dart';

class DetailLayananPublik extends StatefulWidget {
  final LayananPublikData layanan;
  DetailLayananPublik({required this.layanan});
  static String routeName = "/layanan";
  @override
  _DetailLayananPublik createState() => _DetailLayananPublik();
}

class _DetailLayananPublik extends State<DetailLayananPublik> {
  final ApiLayananPublik api = ApiLayananPublik();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: appBar(),
      body: Column(
        children: [
          _headerPage(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 600,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.layanan.deskripsi,
                  style: const TextStyle(fontSize: 16, fontFamily: "DmSans"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerPage() {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: headerDecoration,
      child: Center(
        child: Text(
          widget.layanan.nama,
          style: headerTextStyle,
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LayananPublik();
            },
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
      ),
      title: Text('Layanan Publik'),
      backgroundColor: darkGreen1,
    );
  }
}
