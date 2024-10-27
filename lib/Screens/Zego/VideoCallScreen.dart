import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoCall extends StatefulWidget {
  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  void initState() {
    super.initState();
    _initializeCamera();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  CameraController? _controller;

  List<CameraDescription>? cameras;

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      cameras![0],
      ResolutionPreset.high,
    );
    await _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: size.width * 0.5,
                    height: size.height,
                    child: CameraPreview(_controller!),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    width: size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mic),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.video_call),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.call,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: size.width * 0.5,
                    height: size.height,
                    child: CameraPreview(_controller!),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    width: size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mic),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.video_call),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.call,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
