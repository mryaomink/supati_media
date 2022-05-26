import 'package:flutter/material.dart';
import 'package:surapati_media/screens/yao_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Surapati Media',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YaoSplash(),
    );
  }
}
