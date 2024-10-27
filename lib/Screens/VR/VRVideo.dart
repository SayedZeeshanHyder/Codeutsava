import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller = VideoPlayerController.asset(widget.videoUrl);

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initializing,
              // display the video.
              return Row(
                children: [
                  Expanded(child: VideoPlayer(_controller),),
                  Expanded(child: VideoPlayer(_controller),),
                ],
              );
            } else {
              // If the video is still loading, show a loading spinner.
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Pause or play the video based on its current state.
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),*/
    );
  }

}
