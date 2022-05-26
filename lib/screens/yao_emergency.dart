import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YaoEmergency extends StatelessWidget {
  const YaoEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => launch("tel://085232580204"),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.redAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => launch("tel://085232580204"),
                        icon: Icon(
                          Icons.call,
                          size: 75,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Offline Call',
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => launch(
                    "https://wa.me/62859196406508?text=Saya%20ingin%20melaporkan%20kejadian%20Kebakaran"),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () => launch(
                            "https://wa.me/62859196406508?text=Saya%20ingin%20melaporkan%20kejadian%20Kebakaran"),
                        icon: Icon(
                          Icons.whatshot,
                          size: 75,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Online Call (WA)',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
