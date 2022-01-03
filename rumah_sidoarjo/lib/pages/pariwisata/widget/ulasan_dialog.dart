import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:path/path.dart' as pt;

class UlasanDialog extends StatefulWidget {
  UlasanDialog(
      {Key? key, required this.pariwisata, required this.onAddUlasanSucces})
      : super(key: key);
  Pariwisata pariwisata;
  final Function onAddUlasanSucces;

  @override
  _UlasanDialogState createState() => _UlasanDialogState();
}

class _UlasanDialogState extends State<UlasanDialog> {
  final _ulasanController = TextEditingController();
  List<File?> listFoto = [null, null, null];

  Future<File?> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) {
        return null;
      }

      File? imageTemp;

      if (source == ImageSource.camera) {
        imageTemp = await saveImagePermanently(image.path);
      } else {
        imageTemp = File(image.path);
      }

      return imageTemp;
    } on PlatformException catch (e) {
      print('failed pick image: ${e.toString()}');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationSupportDirectory();
    final name = pt.basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.network(
                "$fotoUrl/assets/img/${widget.pariwisata.foto1}",
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
              const Padding(padding: EdgeInsets.only(left: 20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pariwisata.namaWisata,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.dmSans(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.pariwisata.alamat,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.dmSans(fontSize: 12, color: darkGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _ulasanController,
            decoration: InputDecoration(
                hintText: 'Masukkan Ulasan', hintStyle: GoogleFonts.dmSans()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        final defaultContext = context;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () async {
                                final image =
                                    await pickImage(ImageSource.gallery);

                                if (image != null) {
                                  setState(() {
                                    listFoto[0] = image;
                                  });
                                  print('jumlah foto: ${listFoto.length}');
                                  Get.back();
                                }
                              },
                              title: const Text(
                                'Ambil dari galeri',
                                style: TextStyle(fontFamily: 'poppins'),
                              ),
                              leading: const Icon(Icons.image),
                            ),
                            ListTile(
                              onTap: () async {
                                final image =
                                    await pickImage(ImageSource.camera);

                                if (image != null) {
                                  setState(() {
                                    listFoto[0] = image;
                                  });
                                  print('jumlah foto: ${listFoto.length}');
                                  Get.back();
                                }
                              },
                              title: const Text(
                                'Ambil dari kamera',
                                style: TextStyle(fontFamily: 'poppins'),
                              ),
                              leading: const Icon(Icons.camera_alt),
                            ),
                          ],
                        );
                      });
                },
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: listFoto[0] != null
                            ? Image.file(listFoto[0]!, fit: BoxFit.cover)
                            : Image.asset(
                                "assets/images/no_image.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipOval(
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.white,
                            child: const Icon(Icons.camera_alt),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        final defaultContext = context;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () async {
                                final image =
                                    await pickImage(ImageSource.gallery);

                                if (image != null) {
                                  setState(() {
                                    listFoto[1] = image;
                                  });
                                  print('jumlah foto: ${listFoto.length}');
                                  Get.back();
                                }
                              },
                              title: const Text(
                                'Ambil dari galeri',
                                style: TextStyle(fontFamily: 'poppins'),
                              ),
                              leading: const Icon(Icons.image),
                            ),
                            ListTile(
                              onTap: () async {
                                final image =
                                    await pickImage(ImageSource.camera);

                                if (image != null) {
                                  setState(() {
                                    listFoto[1] = image;
                                  });
                                  print('jumlah foto: ${listFoto.length}');
                                  Get.back();
                                }
                              },
                              title: const Text(
                                'Ambil dari kamera',
                                style: TextStyle(fontFamily: 'poppins'),
                              ),
                              leading: const Icon(Icons.camera_alt),
                            ),
                          ],
                        );
                      });
                },
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Stack(
                    children: [
                      SizedBox(
                        child: listFoto[1] != null
                            ? Image.file(listFoto[1]!, fit: BoxFit.cover)
                            : Image.asset(
                                "assets/images/no_image.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipOval(
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.white,
                            child: const Icon(Icons.camera_alt),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        final defaultContext = context;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () async {
                                final image =
                                    await pickImage(ImageSource.gallery);

                                if (image != null) {
                                  setState(() {
                                    listFoto[2] = image;
                                  });
                                  print('jumlah foto: ${listFoto.length}');
                                  Get.back();
                                }
                              },
                              title: const Text(
                                'Ambil dari galeri',
                                style: TextStyle(fontFamily: 'poppins'),
                              ),
                              leading: const Icon(Icons.image),
                            ),
                            ListTile(
                              onTap: () async {
                                final image =
                                    await pickImage(ImageSource.camera);

                                if (image != null) {
                                  setState(() {
                                    listFoto[2] = image;
                                  });
                                  print('jumlah foto: ${listFoto.length}');
                                  Get.back();
                                }
                              },
                              title: const Text(
                                'Ambil dari kamera',
                                style: TextStyle(fontFamily: 'poppins'),
                              ),
                              leading: const Icon(Icons.camera_alt),
                            ),
                          ],
                        );
                      });
                },
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Stack(
                    children: [
                      SizedBox(
                        child: listFoto[2] != null
                            ? Image.file(listFoto[2]!, fit: BoxFit.cover)
                            : Image.asset(
                                "assets/images/no_image.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipOval(
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.white,
                            child: const Icon(Icons.camera_alt),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            if (_ulasanController.text.isEmpty) {
              Fluttertoast.showToast(msg: 'Ulasan tidak boleh kosong');
              return;
            }
            if (widget.pariwisata.kategori == 'pemancingan') {
              final api = ApiPariwisata();

              final status = await api.postUlasan(
                  listFoto, widget.pariwisata.idWisata, _ulasanController.text);

              if (status) {
                widget.onAddUlasanSucces();
                Get.back();
              }
            }
            if (widget.pariwisata.kategori == 'sejarah') {
              final api = ApiPariwisata();

              final status = await api.postUlasan(
                  listFoto, widget.pariwisata.idWisata, _ulasanController.text);

              if (status) {
                widget.onAddUlasanSucces();
                Get.back();
              }
            }
            if (widget.pariwisata.kategori == 'kuliner') {
              final api = ApiPariwisata();

              final status = await api.postUlasan(
                  listFoto, widget.pariwisata.idWisata, _ulasanController.text);

              if (status) {
                widget.onAddUlasanSucces();
                Get.back();
              }
            }
          },
          child: const Text('Kirim'),
        ),
      ],
    );
  }
}
