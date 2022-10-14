import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/src/audio_controller/audio_controller.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page2.dart';
import 'package:learning/src/responsive.dart';
import 'package:photo_view/photo_view.dart';
import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:rxdart/rxdart.dart';

import '../../tool_widgets.dart';

class LearningPage1 extends StatefulWidget {
  const LearningPage1({Key? key}) : super(key: key);

  @override
  State<LearningPage1> createState() => _LearningPage1State();
}

class _LearningPage1State extends State<LearningPage1> {
  bool textpopUpVisible = false;
  bool imagepopUpVisible = false;
  bool startPlay = false;
  late Stream<DurationState> _durationState;
  String imageChoosen = "assets/images/l1.png";
  final player = justAudio.AudioPlayer();
  ScrollController scrollController = ScrollController();
  String txt =
      "ကမ္ဘာမြေရဲ့ တစ်နေရာနဲ့ တစ်နေရာ၊ လယ်ကွင်းတစ်ခုရဲ့ တစ်နေရာနဲ့ တစ်နေရာ‌ပေါ် မူတည်ပြီး မြေဆီလွှာ‌တွေက ကွဲပြားမှု ရှိပါတယ်။ သူတို့ ဘယ်လိုဖြစ်‌ပေါ်လာလဲဆိုတဲ့ အပေါ်မူတည်ပြီးတော့လည်း မြေဆီလွှာတွေက ကွဲပြားမှုရှိကြပါတယ်။ မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရာတွေကြောင့် မတူကွဲပြားတဲ့ မြေဆီလွှာအမျိုးမျိုး ဖြစ်ပေါ်လာရပါတယ်။ ";

  @override
  void initState() {
    super.initState();
    _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player.positionStream,
        player.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
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
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 52),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        setState(() {
                          startPlay = true;
                        });
                        await playSound();
                      },
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.3,
                              right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/images/profile1.png",
                                    width: 52,
                                  ),
                                  startPlay ? _playButton() : Container()
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(width: 60, child: _progressBar())
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: shadowDecorationWithBorderColor(
                          const Color.fromARGB(200, 113, 101, 45),
                          const Color.fromARGB(180, 113, 101, 45),
                          12),
                      margin: const EdgeInsets.only(top: 60),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.54,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: 12,
                          top: 12,
                          bottom: 12),
                      child: Stack(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                imagepopUpVisible = true;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                "assets/images/expand.png",
                                width: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Image.asset(
                            imageChoosen,
                            width: MediaQuery.of(context).size.width * 0.32,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width * 0.74,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      bottom: 8),
                  padding: const EdgeInsets.only(
                      left: 24, top: 8, bottom: 8, right: 8),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(200, 113, 101, 45),
                      const Color.fromARGB(200, 113, 101, 45),
                      12),
                  child: Stack(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            textpopUpVisible = true;
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/images/expand.png",
                            width: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 36),
                        child: Scrollbar(
                          trackVisibility: true,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              txt,
                              style: TextStyle(
                                  height: 1.7,
                                  color: Colors.white,
                                  fontSize:
                                      Responsive.isMobile(context) ? 16 : 19),
                            ),
                          )),
                        ),
                      ),
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                  visible: textpopUpVisible, child: textPopUpWidget()),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                  visible: imagepopUpVisible, child: imagePopUpWidget()),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Visibility(
                visible: !imagepopUpVisible,
                child: Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.only(bottom: 8, right: 20),
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/images/arrow_right.png",
                      width: 20,
                    ),
                    onTap: () {
                      if (player.playing) {
                        player.stop();
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LearningPage2())));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            player.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          timeLabelLocation: TimeLabelLocation.none,
          barHeight: 6,
          baseBarColor: Colors.white,
          thumbRadius: 2,
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if ((processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) &&
            !startPlay) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: player.play,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () => player.seek(Duration.zero),
          );
        }
      },
    );
  }

  Future<void> playSound() async {
    if (player.playing) {
      player.stop();
    }
    await player.setAsset('assets/audio/s1.wav', preload: true);

    await player.play();
  }

  Widget textPopUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width * 0.58,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.14,
              bottom: Responsive.isMobile(context)
                  ? 12
                  : MediaQuery.of(context).size.height * 0.26),
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(255, 255, 216, 95),
              const Color.fromARGB(255, 255, 216, 95),
              12),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      textpopUpVisible = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: Responsive.isMobile(context) ? 32 : 38,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60, top: 30, bottom: 20),
                child: Scrollbar(
                  controller: scrollController,
                  trackVisibility: true,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.only(
                            left: 30, bottom: 16, right: 50),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            txt,
                            style: TextStyle(
                                height: 1.8,
                                color: Colors.black,
                                fontSize:
                                    Responsive.isMobile(context) ? 16 : 19),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget imagePopUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: shadowDecorationWithBorderColor(
            const Color.fromARGB(180, 0, 0, 0),
            const Color.fromARGB(180, 113, 101, 45),
            12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.98,
                    child: PhotoView(
                      imageProvider: AssetImage(imageChoosen),
                      backgroundDecoration:
                          const BoxDecoration(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        imagepopUpVisible = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/close.png",
                        width: Responsive.isMobile(context) ? 32 : 38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
