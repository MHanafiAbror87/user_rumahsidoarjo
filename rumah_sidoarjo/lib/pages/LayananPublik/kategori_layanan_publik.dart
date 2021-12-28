import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/models/kategori_layanan_publik.dart';
import 'package:rumah_sidoarjo/models/layanan_publik.dart';
import 'package:rumah_sidoarjo/pages/LayananPublik/detail_layanan_publik.dart';
import 'package:rumah_sidoarjo/pages/LayananPublik/layananpublik.dart';
import 'package:rumah_sidoarjo/services/api_layanan_publik.dart';

class KategoriLayananPublik extends StatefulWidget {
  final KategoriLayananData kategori;
  KategoriLayananPublik({required this.kategori});
  static String routeName = "/layanan";
  @override
  _KategoriLayananPublik createState() => _KategoriLayananPublik();
}

class _KategoriLayananPublik extends State<KategoriLayananPublik> {
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
          SizedBox(
            height: 600,
            child: FutureBuilder<List<LayananPublikData>>(
                future: api.getKategoriById(widget.kategori.idKategorilayanan),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final layanan = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: SizedBox(
                            height: 65,
                            child: GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailLayananPublik(
                                          layanan: layanan))),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        layanan.nama,
                                        style: textKategori,
                                      ),
                                      Image.asset(
                                        'assets/images/arrow_forward.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Layanan Publik',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo cari tau syarat pembuatan dokumen kependudukan',
                textAlign: TextAlign.center,
                style: headerSubTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
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
                return const LayananPublik();
              },
            ),
          ),
        },
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
