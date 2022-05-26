import 'package:flutter/material.dart';

class DonasiEvent extends StatelessWidget {
  const DonasiEvent({
    Key? key,
    required this.lebar,
  }) : super(key: key);

  final double lebar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: lebar,
      height: 230,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF1E1E1),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/imgcontainer.jpg',
          ),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Text(
          'Donasi dan Event Sosial\nLainnya Klik Disini',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
