import 'package:flutter/material.dart';

class YaoDonasi extends StatelessWidget {
  const YaoDonasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text(
            'Coming Soon !',
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
