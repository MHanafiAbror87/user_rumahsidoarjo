import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailBerita extends StatelessWidget {
  final ListBeritaModel berita;

  const DetailBerita({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(berita.judul),
      ),
      body: WebView(initialUrl: "https://www.sidoarjokab.go.id/${berita.slug}"),
    );
  }
}
