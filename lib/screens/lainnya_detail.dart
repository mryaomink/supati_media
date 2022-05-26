import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:surapati_media/model/news.dart';
import 'package:url_launcher/url_launcher.dart';

class LainnyaDetail extends StatelessWidget {
  final Article? article;

  const LainnyaDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
            color: Colors.black,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: FadeInImage(
                      image: NetworkImage(
                        article!.urlToImage.toString(),
                      ),
                      placeholder: AssetImage(
                        "assets/images/surapati.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      article!.title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            article!.description,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Selengkapnya di ',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    )),
                                TextSpan(
                                    text: article!.url,
                                    style: TextStyle(color: Colors.red),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        var url = article!.url;
                                        if (url.isNotEmpty) {
                                          canLaunch(url);
                                          launch(url);
                                        } else {
                                          throw "tidak bisa buka link";
                                        }
                                      })
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Sumber Dari: ${article!.source.name}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])));
  }
}
