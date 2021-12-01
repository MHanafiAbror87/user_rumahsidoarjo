import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';

class Sejarah extends StatefulWidget {
  @override
  _SejarahState createState() => _SejarahState();
}

class _SejarahState extends State<Sejarah> {
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Card(
                  margin: const EdgeInsets.all(5),
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
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
  "Museum Mpu Tantular",
];

final List alamat = [
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
  "Sidoarjo, Sidoarjo",
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
