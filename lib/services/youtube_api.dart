import 'dart:convert';
import 'dart:io';

import 'package:surapati_media/model/channel_model.dart';
import 'package:http/http.dart' as http;
import 'package:surapati_media/model/video_models.dart';
import 'package:surapati_media/utilities/keys.dart';

class YoutubeApi {
  YoutubeApi._instantiate();
  static final YoutubeApi instance = YoutubeApi._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails,statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var respon = await http.get(uri, headers: headers);
    if (respon.statusCode == 200) {
      Map<String, dynamic> data = json.decode(respon.body)['items'][0];
      Channel? channel = Channel.fromMap(data);

      channel.videos = await fetchVideoFromPlaylist(
        playlistId: channel.uploadPlaylistId!,
      );
      return channel;
    } else {
      throw json.decode(respon.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideoFromPlaylist(
      {required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      videosJson.forEach(
        (json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
