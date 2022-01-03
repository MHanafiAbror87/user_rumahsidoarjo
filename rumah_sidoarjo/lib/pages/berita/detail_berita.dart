import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';

import 'package:webview_flutter/webview_flutter.dart';
// import 'package:html/parser.dart' as htmlparser;
// import 'package:html/dom.dart' as dom;
// import 'package:url_launcher/url_launcher.dart';

class DetailBerita extends StatefulWidget {
  final ListBeritaModel berita;

  const DetailBerita({Key? key, required this.berita}) : super(key: key);

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  // dom.Document? document;

  // @override
  // void initState() {
  //   document = htmlparser.parse(widget.berita.isiberita);
  //   super.initState();
  // }

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
        title: Text(widget.berita.judul),
        backgroundColor: darkGreen1,
      ),
      body: WebView(
          initialUrl: "https://www.sidoarjokab.go.id/${widget.berita.slug}"),
      // body: Html.fromDom(
      //   document: htmlparser.parse(
      //       '<p style="text-align: center;"><a title="PENGUMUMAN SELEKSI PENERIMAAN TENAGA NON ASN DISKOMINFO SIDOARJO T.A. 2022" href="\/uploads\/2021\/12\/pengumuman-rekruitmen-non-asn-kominfo-2022compressed-1.pdf" target="_blank" rel="noopener noreferrer">PENGUMUMAN SELEKSI PENERIMAAN TENAGA NON ASN DISKOMINFO SIDOARJO T.A. 2022<\/a><\/p>'),
      //   // onAnchorTap: (url, context, data, element) {
      //   //   String to =
      //   //       "https:https://www.sidoarjokab.go.id/${widget.berita.slug}";
      //   //   launch(to);
      //   // },
      //   // onLinkTap: (url, context, data, element) {
      //   //   String to =
      //   //       "https:https://www.sidoarjokab.go.id/${widget.berita.slug}";
      //   //   launch(to);
      //   // },
      // ),
    );
  }
}
