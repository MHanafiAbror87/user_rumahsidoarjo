import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/kesehatan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailKesehatanRsu extends StatefulWidget {
  final KesehatanData kesehatan;
  DetailKesehatanRsu({required this.kesehatan});

  @override
  _DetailKesehatanRsuState createState() => _DetailKesehatanRsuState();
}

class _DetailKesehatanRsuState extends State<DetailKesehatanRsu> {
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
    center = LatLng(double.parse(widget.kesehatan.lat),
        double.parse(widget.kesehatan.long));
    _markers[widget.kesehatan.nama] = Marker(
      markerId: MarkerId(widget.kesehatan.nama),
      position: LatLng(double.parse(widget.kesehatan.lat),
          double.parse(widget.kesehatan.long)),
      infoWindow: InfoWindow(
        title: widget.kesehatan.nama,
        snippet: widget.kesehatan.alamat,
      ),
    );

    setState(() {
      center;
    });
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
                return Kesehatan();
              },
            ),
          ),
        ),
        title: const Text('Detail Kesehatan'),
        backgroundColor: darkGreen1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 210,
                child: Image.network(
                    "$fotoUrl/assets/img/${widget.kesehatan.foto}",
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                Text(
                  widget.kesehatan.nama,
                  style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Alamat',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.kesehatan.alamat,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kecamatan',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.kesehatan.kecamatan,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.kesehatan.kategori,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kepemilikan',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.kesehatan.kepemilikan,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Telepon',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.kesehatan.noTelepon,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () =>
                                launch("tel://${widget.kesehatan.noTelepon}"),
                            child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: darkGreen1,
                                  borderRadius: BorderRadius.circular(30),
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
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Website',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.kesehatan.website,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Lokasi ${widget.kesehatan.nama}',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
            )
          ],
        ),
      ),
    );
  }
}
