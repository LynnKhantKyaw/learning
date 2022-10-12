import 'package:flutter/material.dart';
import 'package:learning/src/components/video_items.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/learning_page/components/title_container.dart';

class VideoListByModuleScreen extends StatefulWidget {
  const VideoListByModuleScreen({super.key});

  @override
  State<VideoListByModuleScreen> createState() =>
      _VideoListByModuleScreenState();
}

class _VideoListByModuleScreenState extends State<VideoListByModuleScreen> {
  int isSelected = 0;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            const BackgroundPage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SectionIntroHearder(
                title: "ဗီဒီယိုများ",
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 70, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      children: [
                        TitleContianer(
                          onTap: () {
                            setState(() {
                              isSelected = 0;
                            });
                          },
                          title: 'စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ အလေ့အထမျာ',
                          fontSize: 15,
                          bgColor: isSelected == 0 ? Colors.white : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        TitleContianer(
                          onTap: () {
                            setState(() {
                              isSelected = 1;
                            });
                          },
                          title:
                              'Organizing and Strengthening \nFarmer Organization',
                          fontSize: 15,
                          bgColor: isSelected == 1 ? Colors.white : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        TitleContianer(
                          onTap: () {
                            setState(() {
                              isSelected = 2;
                            });
                          },
                          title: 'Sustainable Natural Rubber',
                          fontSize: 15,
                          bgColor: isSelected == 2 ? Colors.white : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              isSelected == 0
                                  ? 'assets/images/papersmall.png'
                                  : "",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: isSelected == 0
                            ? VideoItemsPage(
                                index1: 0,
                              )
                            : isSelected == 1
                                ? VideoItemsPage(
                                    index1: 1,
                                  )
                                : VideoItemsPage(
                                    index1: 2,
                                  )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
