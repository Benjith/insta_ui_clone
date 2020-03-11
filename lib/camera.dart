import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instaclone_ben/appdata.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
        title: Text(
          'Photo',
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                CameraApp(),
                Text('data')
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.radio_button_unchecked,
                        ),
                        iconSize: 72,
                        onPressed: () {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('GALLERY'),
                      Text('PHOTO'),
                      Text('VIDEO'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(AppData.cameras[0], ResolutionPreset.low);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    // return  CameraPreview(controller);
    return AspectRatio(
        aspectRatio: 1,
        child: CameraPreview(controller));
  }
}
