import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';

class SD extends StatefulWidget {
  @override
  _SDState createState() => _SDState();
}

class _SDState extends State<SD> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: nama.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        gambar[index],
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                width: 300,
                                child: Text(
                                  nama[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: 30,
                                  width: 300,
                                  child: Text(
                                    alamat[index],
                                    style: TextStyle(fontSize: 12),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}

final List nama = [
  "SD Negeri Sidokare I",
  "SD Negeri Sidokare II",
  "SD Negeri Sidokare III",
  "SD Negeri Sidokare IV",
  "SD Negeri Sidokare I",
  "SD Negeri Sidokare II",
  "SD Negeri Sidokare III",
  "SD Negeri Sidokare IV",
  "SD Negeri Sidokare I",
  "SD Negeri Sidokare II",
];
final List alamat = [
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
  "Sidokare Sidoarjo",
];

final List gambar = [
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
  Image.asset('assets/images/no_image.png', width: 50),
];
