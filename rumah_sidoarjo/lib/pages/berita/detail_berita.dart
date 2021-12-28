import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailBerita extends StatelessWidget {
  final ListBeritaModel berita;

  const DetailBerita({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => {
            Navigator.pop(
              context,
            )
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          ),
        ),
        title: Text(berita.judul),
        backgroundColor: darkGreen1,
      ),
      body: WebView(initialUrl: "https://www.sidoarjokab.go.id/${berita.slug}"),
    );
  }
}
