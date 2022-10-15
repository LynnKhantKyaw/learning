import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learning/src/audio_controller/audio_controller.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page1.dart';
import 'package:learning/src/learning_page/learning_page3.dart';
import 'package:learning/src/responsive.dart';
import 'package:photo_view/photo_view.dart';
import 'package:just_audio/just_audio.dart' as justAudio;
import 'package:rxdart/rxdart.dart';
import '../../tool_widgets.dart';

class LearningPage2 extends StatefulWidget {
  const LearningPage2({Key? key}) : super(key: key);

  @override
  State<LearningPage2> createState() => _LearningPage2State();
}

class _LearningPage2State extends State<LearningPage2> {
  bool imagepopUpVisible = false;
  String imageChoosen = "assets/images/l2.png";
  String txt =
      "မြေဆီလွှာမှာ အဓိကပါဝင်မှု (၅)မျိုး ရှိပါတယ်။ ၎င်းတို့ကတော့ - \n၁။ ကျောက်တုံးကျောက်ဆောင်များ ပြိုကွဲခြင်းနှင့် ပျက်စီးခြင်းတို့မှ ဖြစ်ပေါ်လာသော ဓာတ်သတ္တုများ\n၂။ အပင်အကြွင်းအကျန်များ၊ တိရစ္ဆာန်အကြွင်းအကျန်များနှင့် အဏုဇီဝတစ်ရှုးများ ဆွေးမြေ့ရာမှ ဖြစ်ပေါ်လာသော သဘာဝမြေဆွေး \n၃။ ရေ \n၄။ လေနှင့် ဓာတ်ငွေ့များ  \n၅။ သက်ရှိများ (တီကောင်၊ အင်းဆက်ကဲ့သို့သော အကောင်ကြီးများနှင့် အဏုဇီဝပိုးများ ကဲ့သို့သော အကောင်ငယ်များ)";
  bool startPlay = false;
  late Stream<DurationState> _durationState;
  final player = justAudio.AudioPlayer();
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
              backImage: "assets/images/agre_back.jpg",
            ),
            const SessionHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(200, 113, 101, 45),
                      const Color.fromARGB(200, 113, 101, 45),
                      12),
                  margin: EdgeInsets.only(
                    top: 60,
                    left: MediaQuery.of(context).size.width * 0.09,
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: const EdgeInsets.only(
                      right: 12, top: 12, bottom: 12, left: 12),
                  child: Stack(
                    children: [
                      Image.asset(
                        imageChoosen,
                        width: MediaQuery.of(context).size.width * 0.38,
                      ),
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
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: const EdgeInsets.only(
                    left: 12,
                    right: 20,
                    bottom: 8,
                    top: 68,
                  ),
                  padding: const EdgeInsets.only(
                      left: 24, top: 16, bottom: 8, right: 8),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(200, 113, 101, 45),
                      const Color.fromARGB(200, 113, 101, 45),
                      12),
                  child: Stack(
                    children: [
                      Scrollbar(
                        trackVisibility: true,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 70),
                            child: Text(
                              txt,
                              style: TextStyle(
                                  height: 1.7,
                                  color: Colors.white,
                                  fontSize:
                                      Responsive.isMobile(context) ? 16 : 19),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            setState(() {
                              startPlay = true;
                            });
                            await playSound();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 2, right: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _playButton(),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(width: 60, child: _progressBar())
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                            builder: ((context) => const LearningPage3())));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(bottom: 8, left: 8),
                child: GestureDetector(
                  child: Image.asset(
                    "assets/images/arrow_left.png",
                    width: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LearningPage1())));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                  visible: imagepopUpVisible, child: imagePopUpWidget()),
            ),
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
          return GestureDetector(
            onTap: player.play,
            child: Image.asset(
              "assets/images/profile1.png",
              width: 52,
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return GestureDetector(
            onTap: player.pause,
            child: Image.asset(
              "assets/images/profile1.png",
              width: 52,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () => player.seek(Duration.zero),
            child: Image.asset(
              "assets/images/profile1.png",
              width: 52,
            ),
          );
        }
      },
    );
  }

  Future<void> playSound() async {
    if (player.playing) {
      player.stop();
    }
    await player.setAsset('assets/audio/s2.wav', preload: true);

    await player.play();
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
