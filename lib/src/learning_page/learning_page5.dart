import 'package:flutter/material.dart';
import 'package:learning/src/interactive/soil_column_page.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page4.dart';
import 'package:learning/src/responsive.dart';
import 'package:photo_view/photo_view.dart';

import '../../tool_widgets.dart';

class LearningPage5 extends StatefulWidget {
  const LearningPage5({Key? key}) : super(key: key);

  @override
  State<LearningPage5> createState() => _LearningPage5State();
}

class _LearningPage5State extends State<LearningPage5> {
  bool imagepopUpVisible = false;
  String imageChoosen = "assets/images/l6.jpg";

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
            Container(
              decoration: shadowDecorationWithBorderColor(
                  const Color.fromARGB(200, 113, 101, 45),
                  const Color.fromARGB(200, 113, 101, 45),
                  12),
              margin: EdgeInsets.only(
                top: 60,
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.only(
                  right: 12, top: 12, bottom: 12, left: 12),
              child: Stack(
                children: [
                  Image.asset(
                    imageChoosen,
                    width: MediaQuery.of(context).size.width * 0.8,
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
                            builder: ((context) => const SoilColumnPage())));
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
                            builder: ((context) => const LearningPage4())));
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
