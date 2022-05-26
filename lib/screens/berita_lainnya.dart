import 'package:flutter/material.dart';
import 'package:surapati_media/model/news.dart';
import 'package:surapati_media/screens/lainnya_detail.dart';
import 'package:surapati_media/services/api_service.dart';

class BeritaLainnya extends StatefulWidget {
  @override
  _BeritaLainnyaState createState() => _BeritaLainnyaState();
}

class _BeritaLainnyaState extends State<BeritaLainnya> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Article>>(
          future: apiService.getPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Article> artics = snapshot.data!;
              return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: artics.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LainnyaDetail(
                                        article: artics[index],
                                      )));
                        },
                        child: buildLainya(artics, index),
                      );
                    }),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildLainya(List<Article> artics, int index) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              height: 220,
              child: FadeInImage(
                image: NetworkImage(
                  artics[index].urlToImage.toString(),
                ),
                placeholder: AssetImage(
                  "assets/images/surapati.png",
                ),
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            artics[index].title,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   artics[index].url,
          //   style: TextStyle(
          //     fontSize: 14.0,
          //     color: Colors.red,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ],
      ),
    ));
  }
}
