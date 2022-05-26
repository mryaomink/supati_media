import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surapati_media/screens/yao_donasi.dart';
import 'package:surapati_media/screens/yao_emergency.dart';

import 'package:surapati_media/screens/yao_news.dart';
import 'package:surapati_media/screens/yao_vidlist.dart';
import 'package:surapati_media/widgets/donasi_event.dart';
import 'package:surapati_media/widgets/home_header.dart';

class YaoHome extends StatelessWidget {
  const YaoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffDA221E),
        body: Container(
          height: tinggi,
          width: lebar,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: HomeHeader(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YaoDonasi(),
                      ),
                    );
                  },
                  child: DonasiEvent(
                    lebar: lebar,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YaoVidlist(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 245,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => YaoVidlist(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.slow_motion_video,
                                  size: 40, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Surapati Video',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YaoNews(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 245,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => YaoNews(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.book,
                                  size: 40, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Surapati Info',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BtnEmergency(lebar: lebar)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BtnEmergency extends StatelessWidget {
  const BtnEmergency({
    Key? key,
    required this.lebar,
  }) : super(key: key);

  final double lebar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lebar,
      height: 80,
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff1c1c1c),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YaoEmergency(),
            ),
          );
        },
        child: Text(
          'Emergency Call'.toUpperCase(),
          style: TextStyle(
              fontSize: 24,
              color: Color(0xffF1E1E1),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
