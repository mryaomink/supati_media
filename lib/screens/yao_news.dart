import 'package:flutter/material.dart';
import 'package:surapati_media/screens/berita_lainnya.dart';

import 'package:surapati_media/screens/yao_cardnews.dart';

class YaoNews extends StatefulWidget {
  const YaoNews({Key? key}) : super(key: key);

  @override
  _YaoNewsState createState() => _YaoNewsState();
}

class _YaoNewsState extends State<YaoNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Berita Surapati'),
          ),
          backgroundColor: Colors.black54,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 420.0,
                child: YaoCardnews(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Berita Lainnya',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 1,
                      color: Colors.redAccent,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 460.0,
                child: BeritaLainnya(),
              ),
            ],
          ),
        ));
  }
}
