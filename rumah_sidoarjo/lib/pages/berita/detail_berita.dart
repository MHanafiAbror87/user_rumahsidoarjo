import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

class DetailBerita extends StatefulWidget {
  final ListBeritaModel berita;

  const DetailBerita({Key? key, required this.berita}) : super(key: key);

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  // String _parseHtmlString(String htmlString) {
  //   final document = parse(htmlString);
  //   final String parsedString =
  //       parse(document.body!.text).documentElement!.text;

  //   return parsedString;
  // }
  dom.Document? document;

  @override
  void initState() {
    document = htmlparser.parse(widget.berita.isiberita);
    super.initState();
  }

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
        body: Html.fromDom(document: document));
  }
}
