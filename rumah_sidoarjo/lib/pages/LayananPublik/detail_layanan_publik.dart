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
        //  onTap: () => Navigator.pushReplacement(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => KategoriLayananPublik(
        //                                   kategori: layanan))),
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

// class listKategori extends StatelessWidget {
//   const listKategori({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: kategori.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//           child: Container(
//             height: 65,
//             child: GestureDetector(
//               onTap: () {},
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         kategori[index],
//                         style: textKategori,
//                       ),
//                       Image.asset(
//                         'assets/images/arrow_forward.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

final List kategori = [
  "Pelatihan Untuk Masyarakat",
  "Beasiswa Pendidikan",
  "KTP",
  "SIM",
  "SKCK",
  "Kartu Keluarga",
  "Akta Kelahiran",
  "Akta Kematian",
  "Kartu Pencari Kerja",
];
