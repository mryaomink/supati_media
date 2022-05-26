import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:surapati_media/model/berita_model.dart';
import 'package:surapati_media/screens/yao_newsdet.dart';

class YaoCardnews extends StatelessWidget {
  static String supabaseURL = "https://umpkqgmchtxfmnhvijlj.supabase.co";
  static String supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVtcGtxZ21jaHR4Zm1uaHZpamxqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTA4MTcyODIsImV4cCI6MTk2NjM5MzI4Mn0.qj0gQy5zioI98fyDy-OG9_SHrQUDwMrwHOU6g34Bves";

  final SupabaseClient supabaseClient =
      SupabaseClient(supabaseURL, supabaseKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<News>>(
          future: getNews(),
          builder: (context, AsyncSnapshot<List<News>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: 380.0,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: snapshot.data!
                      .map((news) => Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        YaoNewsdet(news: news),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 16.0),
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 220,
                                        child: Image.network(
                                          news.img!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        news.judul!,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        news.desk!,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Sumber By: ${news.sumber}',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList()),
            );
          }),
    );
  }

  Future<List<News>> getNews() async {
    final respone =
        await supabaseClient.from('surapatinews').select().execute();

    final dataList = respone.data as List;
    return dataList.map((map) => News.fromJson(map)).toList();
  }
}
