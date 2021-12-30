import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/models/lowongan_pekerjaan.dart';
import 'package:rumah_sidoarjo/pages/LowonganPekerjaan/lowongan_kerja.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailLowonganPekerjaan extends StatefulWidget {
  final LowonganPekerjaanData lowongan;
  const DetailLowonganPekerjaan({Key? key, required this.lowongan})
      : super(key: key);

  @override
  _DetailLowonganPekerjaanState createState() =>
      _DetailLowonganPekerjaanState();
}

class _DetailLowonganPekerjaanState extends State<DetailLowonganPekerjaan> {
  late GoogleMapController mapController;

  late LatLng center;
  final Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    googlemaps();
    super.initState();
  }

  void googlemaps() {
    // add lat lng location & marker
    center = LatLng(
        double.parse(widget.lowongan.lat), double.parse(widget.lowongan.long));
    _markers[widget.lowongan.namaPerusahaan] = Marker(
      markerId: MarkerId(widget.lowongan.namaPerusahaan),
      position: LatLng(double.parse(widget.lowongan.lat),
          double.parse(widget.lowongan.long)),
      infoWindow: InfoWindow(
        title: widget.lowongan.namaPerusahaan,
        snippet: widget.lowongan.alamat,
      ),
    );

    setState(() {
      center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
                return const LowonganPekerjaan();
              },
            ),
          ),
        ),
        title: const Text('Detail Lowongan Pekerjaan'),
        backgroundColor: darkGreen1,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: Image.network(
                      "$fotoUrl/assets/img/${widget.lowongan.fotoLowongan}",
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          widget.lowongan.namaPerusahaan,
                          style: const TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Posisi',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.lowongan.judulLowongan,
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
                                'Alamat',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.lowongan.alamat,
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
                                      const Text(
                                        'Telepon',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        widget.lowongan.noTlp,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () => launch(
                                        "tel://${widget.lowongan.noTlp}"),
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
                                        ))),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                                thickness: 2,
                              ),
                              widget.lowongan.website.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
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
                                              widget.lowongan.website,
                                              style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 14,
                                                  color: darkGreen),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () => launch(
                                              "http://${widget.lowongan.website}"),
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
                                                'Kunjungi',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14, color: White),
                                              ))),
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
                                          '-',
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
                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.lowongan.email,
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
                                'Detail Pekerjaan',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.lowongan.deskripsiPekerjaan,
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
                              Text(
                                'Lokasi ${widget.lowongan.namaPerusahaan}',
                                style: const TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
