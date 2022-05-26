import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surapati_media/model/news.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getPost() async {
    final queryParam = {
      'country': 'id',
      'category': 'general',
      'apiKey': '564a38e51dc04988ad8365c33a7f18b3'
    };
    final uri = Uri.https(
      endPointUrl,
      '/v2/top-headlines',
      queryParam,
    );
    final respone = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(respone.body);
    List<dynamic> body = json['articles'];
    List<Article> article =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return article;
  }
}
