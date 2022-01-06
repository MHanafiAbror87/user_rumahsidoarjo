import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/models/list_umkm.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:rumah_sidoarjo/pages/umkm/list_ulasan_umkm.dart';
import 'package:rumah_sidoarjo/pages/umkm/umkm.dart' as page;
import 'package:rumah_sidoarjo/pages/umkm/widget/detail_ulasan_limit.dart';
import 'package:rumah_sidoarjo/pages/umkm/widget/ulasan_dialog_umkm.dart';
import 'package:rumah_sidoarjo/services/api_umkm.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUmkm_Kerajinan extends StatefulWidget {
  final UmkmData kerajinan;
  DetailUmkm_Kerajinan({required this.kerajinan});

  @override
  _DetailUmkm_KerajinanState createState() => _DetailUmkm_KerajinanState();
}

class _DetailUmkm_KerajinanState extends State<DetailUmkm_Kerajinan> {
  final ApiUmkm api = ApiUmkm();
  final _addFormKey = GlobalKey<FormState>();
  final _ulasanController = TextEditingController();
  List<Ulasan> tampilUlasan = [];
  List<File> listFoto = [];

  File? fotoProfil;
  String profileUrl = '';

  late GoogleMapController mapController;

  late LatLng center;
  final Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          ),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page.Umkm();
              },
            ),
          ),
        ),
        title: const Text('Detail Umkm'),
        backgroundColor: darkGreen1,
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: FutureBuilder<DetailUmkmModel>(
            future: api.getUmkmById(widget.kerajinan.idUmkm),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final detail = snapshot.data;

                final umkm = detail!.umkm;
                final semuaUlasan = detail.ulasan;

                // add lat lng location & marker
                center =
                    LatLng(double.parse(umkm.lat), double.parse(umkm.long));
                _markers[umkm.nama] = Marker(
                  markerId: MarkerId(umkm.nama),
                  position:
                      LatLng(double.parse(umkm.lat), double.parse(umkm.long)),
                  infoWindow: InfoWindow(
                    title: umkm.nama,
                    snippet: umkm.alamat,
                  ),
                );

                tampilUlasan.clear();

                if (semuaUlasan.length > 2) {
                  for (var i = 0; i < 2; i++) {
                    tampilUlasan.add(semuaUlasan[i]);
                  }
                } else {
                  tampilUlasan.addAll(semuaUlasan);
                }

                return Container(
                  color: bgColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 210,
                          child: Image.network(
                              "$fotoUrl/assets/img/${umkm.foto1}",
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: White),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Column(
                            children: [
                              Text(
                                umkm.nama,
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Deskripsi',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        umkm.deskripsi,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 20,
                                        thickness: 2,
                                      ),
                                      const Text(
                                        'Alamat',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        umkm.alamat,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 20,
                                        thickness: 2,
                                      ),
                                      const Text(
                                        'Kategori',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        umkm.kategori,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 25,
                                        thickness: 2,
                                      ),
                                      const Text(
                                        'Pengelola',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        umkm.penanggungJawab,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 25,
                                        thickness: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 27),
                                                child: Text(
                                                  'Telepon',
                                                  style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                umkm.noTelp,
                                                style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14,
                                                    color: darkGreen),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                launch("tel://${umkm.noTelp}"),
                                            child: Container(
                                              width: 100,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: darkGreen1,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Panggil',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      color: White),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 25,
                                        thickness: 2,
                                      ),
                                      umkm.website.isNotEmpty
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Website',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        // Text(
                                                        //   umkm.website,
                                                        //   style: TextStyle(
                                                        //       fontFamily:
                                                        //           'DMSans',
                                                        //       fontSize: 14,
                                                        //       color: darkGreen),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () => launch(
                                                      "http://${umkm.website}"),
                                                  child: Container(
                                                    width: 100,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: darkGreen1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Kunjungi',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                color: White),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Website',
                                                  style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Website Tidak Tersedia',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 14,
                                                      color: darkGreen),
                                                ),
                                              ],
                                            ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 25,
                                        thickness: 2,
                                      ),
                                      umkm.email.isNotEmpty
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Email',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          umkm.email,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize: 14,
                                                              color: darkGreen),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () => launch(
                                                      "mailto:${umkm.email}"),
                                                  child: Container(
                                                      width: 100,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: darkGreen1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        'Kirim Email',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                color: White),
                                                      ))),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Email',
                                                  style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Email Tidak Tersedia',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 14,
                                                      color: darkGreen),
                                                ),
                                              ],
                                            ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 25,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'Lokasi ${umkm.nama}',
                                        style: GoogleFonts.dmSans(fontSize: 16),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        height: 500,
                                        child: GoogleMap(
                                          onMapCreated: _onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                            target: center,
                                            zoom: 15.0,
                                          ),
                                          markers: _markers.values.toSet(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ulasan',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            tampilUlasan.isNotEmpty
                                ? TextButton(
                                    onPressed: () => {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ListUlasan_Umkm(
                                            kerajinan: umkm,
                                          ),
                                        ),
                                      ),
                                    },
                                    child: Text('Lihat Semua',
                                        style: GoogleFonts.dmSans(
                                            fontSize: 14, color: darkGreen1)),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      Column(
                        children: tampilUlasan.length > 0
                            ? tampilUlasan
                                .map(
                                  (ulasan) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                    child: Container(
                                      height: 130,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                DetailUlasanLimit(
                                                    kerajinan: ulasan),
                                          );
                                        },
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipOval(
                                                        child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                Image.network(
                                                              "$fotoUrl/assets/img/${ulasan.fotoProfil}",
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              ulasan.nama,
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              DateFormat(
                                                                      'dd MMMM yyyy')
                                                                  .format(ulasan
                                                                      .tanggalUpload),
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "DMSans"),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    ulasan.ulasan,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: "DMSans"),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                            : [
                                const Text("Ulasan Belum Tersedia"),
                              ],
                      ),
                      FutureBuilder<bool>(
                        future: SessionHelper.checkisLogin(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!) {
                              return TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => UlasanDialogUmkm(
                                      kerajinan: umkm,
                                      onAddUlasanSuccess: () {
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(12.0),
                                    width: double.infinity,
                                    child: Text(
                                      'Tambah Ulasan',
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
                                      gradient: LinearGradient(
                                          colors: [lightGreen, darkGreen1],
                                          end: Alignment.centerRight,
                                          begin: Alignment.centerLeft),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              );
                            }

                            return TextButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Tidak Bisa Mengakses'),
                                    content: const Text(
                                        'Harap login terlebih dahulu'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                          return LoginPage();
                                        })),
                                        child: const Text('Log in'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(12.0),
                                  width: double.infinity,
                                  child: Text(
                                    'Tambah Ulasan',
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
                                    gradient: LinearGradient(
                                        colors: [lightGreen, darkGreen1],
                                        end: Alignment.centerRight,
                                        begin: Alignment.centerLeft),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
