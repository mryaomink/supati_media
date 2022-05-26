import 'package:flutter/material.dart';
import 'package:surapati_media/model/video_models.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YaoVideoscreen extends StatefulWidget {
  final String? id;
  final Video? tubeVideo;

  YaoVideoscreen({this.id, this.tubeVideo});

  @override
  _YaoVideoscreenState createState() => _YaoVideoscreenState();
}

class _YaoVideoscreenState extends State<YaoVideoscreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player Is REady');
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              widget.tubeVideo!.title!,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
