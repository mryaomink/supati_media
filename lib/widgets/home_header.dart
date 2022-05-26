import 'package:flutter/material.dart';
import 'package:surapati_media/screens/yao_about.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 24.0,
                color: Color(0xffF1E1E1),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 220,
              height: 50,
              child: Image.asset(
                'assets/images/disurapati.png',
                fit: BoxFit.cover,
              ),
            )
            // Text(
            //   'Di Surapati Media',
            //   style: TextStyle(
            //     fontSize: 26.0,
            //     color: Color(0xffF1E1E1),
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YaoAbout(),
              ),
            );
          },
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              'assets/images/surapati.png',
            ),
          ),
        ),
      ],
    );
  }
}
