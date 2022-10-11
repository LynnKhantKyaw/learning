import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/introduction_page.dart';
import 'package:learning/src/learning_page/components/user_progress_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/learning_page/components/title_container.dart';
import 'package:learning/src/learning_page/components/reference_page.dart';

class LearningPage0 extends StatefulWidget {
  const LearningPage0({super.key});

  @override
  State<LearningPage0> createState() => _LearningPage0State();
}

class _LearningPage0State extends State<LearningPage0> {
  int isSelected = 0;

  String str =
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and m more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""";

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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SectionIntroHearder(),
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
                    height: 50,
                    child: Row(
                      children: [
                        TitleContianer(
                          onTap: () {
                            setState(() {
                              isSelected = 0;
                            });
                          },
                          title: 'Introduction',
                          fontSize: 16,
                          bgColor: isSelected == 0
                              ? Colors.amber.withOpacity(0.4)
                              : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        TitleContianer(
                          onTap: () {
                            setState(() {
                              isSelected = 1;
                            });
                          },
                          title: 'User Progress',
                          fontSize: 16,
                          bgColor: isSelected == 1
                              ? Colors.amber.withOpacity(0.4)
                              : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        TitleContianer(
                          onTap: () {
                            setState(() {
                              isSelected = 2;
                            });
                          },
                          title: 'အညွှန်းကိုးကားချက်များ',
                          fontSize: 16,
                          bgColor: isSelected == 2
                              ? Colors.amber.withOpacity(0.4)
                              : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/papersmall.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: isSelected == 0
                          ? const IntroductionPage()
                          : isSelected == 1
                              ? const UserProgress()
                              : ReferencePage(str: str),
                    ),
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