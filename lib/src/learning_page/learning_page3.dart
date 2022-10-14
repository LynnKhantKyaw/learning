import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page2.dart';
import 'package:learning/src/learning_page/learning_page4.dart';
import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

final videoPlayerController = VideoPlayerController.asset('assets/soil.mp4');

late ChewieController chewieController;

Chewie? playerWidget;

class LearningPage3 extends StatefulWidget {
  const LearningPage3({Key? key}) : super(key: key);

  @override
  State<LearningPage3> createState() => _LearningPage3State();
}

class _LearningPage3State extends State<LearningPage3> {
  @override
  void initState() {
    startVideo();
    // chewieController.deviceOrientationsAfterFullScreen = [
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ];
    // super.initState();
    //  SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  startVideo() async {
    await videoPlayerController.initialize();
    setState(() {
      print(videoPlayerController.value.aspectRatio);
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoPlay: false,
          looping: false,
          allowFullScreen: true,
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
      playerWidget = Chewie(
        controller: chewieController,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: Stack(
          children: [
            BackgroundPage(
              backImage: "assets/images/bg1.jpg",
            ),
            const SessionHeader(),
            Align(
              alignment: Alignment.center,
              child: playerWidget != null
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.08,
                          bottom: MediaQuery.of(context).size.width * 0.03),
                      child: AspectRatio(aspectRatio: 0.8, child: playerWidget),
                    )
                  : Container(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(bottom: 8, right: 8),
                child: GestureDetector(
                  child: Image.asset(
                    "assets/images/arrow_right.png",
                    width: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LearningPage4())));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(bottom: 8, right: 8),
                child: GestureDetector(
                  child: Image.asset(
                    "assets/images/arrow_left.png",
                    width: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LearningPage2())));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
