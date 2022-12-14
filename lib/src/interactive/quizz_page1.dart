import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/common_widget/page_pusher_button.dart';
import 'package:learning/src/common_widget/small_circle_container.dart';
import 'package:learning/src/interactive/quizz_page2.dart';
import 'package:learning/src/interactive/quizz_repo/quiz_page1_list.dart';
import 'package:learning/src/interactive/soil_page.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/tool_widgets.dart';

class QuizzPage1 extends ConsumerStatefulWidget {
  const QuizzPage1({super.key});

  @override
  ConsumerState<QuizzPage1> createState() => _QuizzPage1State();
}

class _QuizzPage1State extends ConsumerState<QuizzPage1> {
  dynamic answer = '';
  List<dynamic> answerList = [];
  bool answerCount = false;
  bool answerCorrect = false;
  final checkanswer = quizList1.map((e) => e.answer).toList();
  final multiselect = quizList1
      .map(
        (e) => MultiSelectCard(
          value: e.multiSelect,
          label: e.multiSelect,
          textStyles: const MultiSelectItemTextStyles(
              textStyle: TextStyle(color: Colors.white)),
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqData,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundPage(
                backImage: "assets/images/agre_back.jpg",
              ),
              const SessionHeader(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      decoration: shadowDecorationWithBorderColor(
                          const Color.fromARGB(200, 113, 101, 45),
                          const Color.fromARGB(200, 113, 101, 45),
                          12),
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      width: double.infinity,
                      height: 80,
                      child: const Text(
                        '?????????????????????????????? ???????????????????????????????????????????????????????????? ?????????????????????',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          direction: Axis.horizontal,
                          children: [
                            MultiSelectContainer(
                              controller: MultiSelectController(),
                              itemsDecoration: MultiSelectDecorations(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 120, 126, 184),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                disabledDecoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                selectedDecoration: BoxDecoration(
                                    color: answerCorrect
                                        ? Colors.green
                                        : const Color.fromARGB(
                                            255, 45, 50, 112),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12))),
                              ),
                              maxSelectableCount: 2,
                              items: multiselect,
                              onChange: ((selectedItems, selectedItem) {
                                answerList.clear();
                                answerList.addAll(selectedItems);
                                setState(() {
                                  answer = selectedItem;
                                  if (selectedItems.length == 2) {
                                    answerCount = false;
                                  } else {
                                    answerCount = true;
                                  }
                                });
                                log(answerList.toString());
                              }),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            log(answer);
                            if (answerCount) {
                              log("Answer Need");
                              final snackBar = SnackBar(
                                content: const Text(
                                    '???????????? ?????????????????? ?????????????????????????????????????????? ????????????????????????????????????'),
                                action: SnackBarAction(
                                  label: '?????????????????????',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              log("Answer No Need");
                              log(checkanswer[0].toString());
                              if (answerList[0] == checkanswer[0] &&
                                  answerList[1] == checkanswer[1]) {
                                setState(() {
                                  answerCorrect = true;
                                });
                                _showSuccessAlertDialog();
                              } else {
                                _showFailAlertDialog();
                              }
                            }
                          },
                          child: Image.asset(
                            "assets/images/check_answer.png",
                            width: 150,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            log(answer);
                            if (answerCount || answerList.length != 2) {
                              log("Answer Need");
                              final snackBar = SnackBar(
                                content: const Text(
                                    '???????????? ?????????????????? ?????????????????????????????????????????? ????????????????????????????????????'),
                                action: SnackBarAction(
                                  label: '?????????????????????',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              log("Answer No Need");
                              log(checkanswer[0].toString());
                              if (answerList[0] == checkanswer[0] &&
                                  answerList[1] == checkanswer[1]) {
                                setState(() {
                                  answerCorrect = true;
                                });
                                _showSuccessAlertDialog();
                              } else {
                                _showFailAlertDialog();
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            child: const Text(
                              '??????????????????????????????',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: QuizCircleIndex(),
              ),
              PagePusherButton(
                forward: false,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SoilPageScreen())));
                },
              ),
              PagePusherButton(
                forward: true,
                onTap: () {
                  ref.read(quizzIndexProvider.notifier).state = 1;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizzPage2(),
                      ));
                  setState(() {
                    answerCount = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSuccessAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          //title: const Text('Cancel booking'),
          contentPadding: EdgeInsets.zero,
          content: Container(
              height: MediaQuery.of(context).size.height * 0.73,
              color: Colors.green,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/images/check_green.png",
                    width: 110,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '???????????????????????? ??????????????????????????? ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              )),
        );
      },
    );
  }

  Future<void> _showFailAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          //title: const Text('Cancel booking'),
          contentPadding: EdgeInsets.zero,
          content: Container(
              height: MediaQuery.of(context).size.height * 0.73,
              color: Colors.red,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/images/close.png",
                    width: 90,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    '???????????????????????? ????????????????????????????????? ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              )),
        );
      },
    );
  }
}

final quizzIndexProvider = StateProvider<int>((ref) {
  return 0;
});
