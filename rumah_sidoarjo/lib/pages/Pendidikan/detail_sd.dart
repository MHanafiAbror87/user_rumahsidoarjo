import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/models/list_sekolah.dart';
import 'package:rumah_sidoarjo/models/pendidikan.dart';
import 'package:rumah_sidoarjo/pages/pendidikan/Pendidikan.dart';
import 'package:rumah_sidoarjo/services/api_pendidikan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail_Sd extends StatefulWidget {
  final SekolahData sekolah;
  Detail_Sd({required this.sekolah});

  @override
  _Detail_SdState createState() => _Detail_SdState();
}

class _Detail_SdState extends State<Detail_Sd> {
  final ApiSekolah api = ApiSekolah();

  late GoogleMapController mapController;

  late LatLng center;
  final Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                return const Pendidikan();
              },
            ),
          ),
        ),
        title: const Text('Detail Sekolah'),
        backgroundColor: darkGreen1,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DetailSekolahModel>(
          future: api.getSdById(widget.sekolah.idSekolah),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final detail = snapshot.data;

              final sekolah = detail!.sekolah;
              final ekskul = detail.ekskul;
              final fasilitas = detail.fasilitas;

              // add lat lng location & marker
              center =
                  LatLng(double.parse(sekolah.lat), double.parse(sekolah.long));
              _markers[sekolah.namaSekolah] = Marker(
                markerId: MarkerId(sekolah.namaSekolah),
                position: LatLng(
                    double.parse(sekolah.lat), double.parse(sekolah.long)),
                infoWindow: InfoWindow(
                  title: sekolah.namaSekolah,
                  snippet: sekolah.alamat,
                ),
              );

              return Container(
                color: bgColor,
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 210,
                          child: Image.network(
                              "$fotoUrl/assets/img/${sekolah.foto}",
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: White),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: Column(
                            children: [
                              Text(
                                sekolah.namaSekolah,
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Alamat',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      sekolah.alamat,
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
                                      'Jenjang',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      sekolah.jenjang,
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
                                      'Status',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      sekolah.status,
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
                                      'NPSN',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      sekolah.npsn,
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
                                      'Akreditasi',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      sekolah.akreditasi,
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
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Telepon',
                                                  style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              sekolah.noTelepon,
                                              style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 14,
                                                  color: darkGreen),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () => launch(
                                              "tel://${sekolah.noTelepon}"),
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
                                                    fontSize: 14, color: White),
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
                                    widget.sekolah.website.isNotEmpty
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
                                                          fontFamily: 'DMSans',
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text(
                                                        widget.sekolah.website,
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
                                                    "http://${widget.sekolah.website}"),
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ekstra Kulikuler',
                                          style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 16,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: ekskul.length > 0
                                              ? ekskul
                                                  .map(
                                                    (ekskul) => Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          ekskul.nama,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize: 14,
                                                              color: darkGreen),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                  .toList()
                                              : [
                                                  Text(
                                                    "Data Ekskul Tidak Tersedia",
                                                    style: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 14,
                                                        color: darkGreen),
                                                  ),
                                                ],
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      height: 25,
                                      thickness: 2,
                                    ),
                                    const Text(
                                      'Fasilitas',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: fasilitas.length > 0
                                          ? fasilitas
                                              .map(
                                                (fasilitas) => Column(
                                                  children: [
                                                    Text(
                                                      fasilitas.nama,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 14,
                                                          color: darkGreen),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList()
                                          : [
                                              Text(
                                                'Data Fasilitas Tidak Tersedia',
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 14,
                                                    color: darkGreen),
                                              )
                                            ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      height: 25,
                                      thickness: 2,
                                    ),
                                    Text(
                                      'Lokasi ${sekolah.namaSekolah}',
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
