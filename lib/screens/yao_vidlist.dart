import 'package:flutter/material.dart';
import 'package:surapati_media/model/channel_model.dart';
import 'package:surapati_media/model/video_models.dart';
import 'package:surapati_media/screens/yao_videoscreen.dart';
import 'package:surapati_media/services/youtube_api.dart';

class YaoVidlist extends StatefulWidget {
  const YaoVidlist({Key? key}) : super(key: key);

  @override
  _YaoVidlistState createState() => _YaoVidlistState();
}

class _YaoVidlistState extends State<YaoVidlist> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannels();
  }

  _initChannels() async {
    Channel channel = await YoutubeApi.instance
        .fetchChannel(channelId: 'UCSYF2CQwSNRHZEOxjETo-lA');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos!.length !=
                        int.parse(_channel!.videoCount!) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel!.videos![index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
    );
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 6.0,
        ),
      ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl!),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _channel!.title!,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   '${_channel!.subscriberCount!} subscribers',
                //   style: TextStyle(
                //     fontSize: 16.0,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.grey[600],
                //   ),
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => YaoVideoscreen(
            id: video.id,
            tubeVideo: video,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl!),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await YoutubeApi.instance
        .fetchVideoFromPlaylist(playlistId: _channel!.uploadPlaylistId!);
    List<Video> allVideos = _channel!.videos!..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }
}
