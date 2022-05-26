import 'package:flutter/material.dart';

import 'package:surapati_media/screens/yao_home.dart';

class YaoSplash extends StatelessWidget {
  const YaoSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffDA221E),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: lebar,
                    height: tinggi * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/murakata.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                        Image.asset(
                          'assets/images/surapati.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   'Surapati Media',
                  //   style: TextStyle(fontSize: 26.0, color: Color(0xffF1E1E1)),
                  // ),
                  Container(
                    child: Image.asset(
                      'assets/images/surapatitext.png',
                      fit: BoxFit.cover,
                      width: 300,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: tinggi / 3,
                    child: Image.asset(
                      'assets/images/surapati.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(height: 16.0),
                  Text(
                    'Informasi & Media',
                    style: TextStyle(
                        fontSize: 26.0,
                        color: Color(0xffF1E1E1),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'seputar informasi kebarakan dan bencana lainnya Sekitar Kalimantan Selatan yang ter-upadate dan sumbernya jelas',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffF1E1E1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
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
                                builder: (context) => YaoHome(),
                              ),
                            );
                          },
                          child: Text(
                            'Klik Disini'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xffF1E1E1),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Text(
                        'Since 2006 \u00a9 Barisan Pemadam Kebakaran Surapati',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffF1E1E1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
