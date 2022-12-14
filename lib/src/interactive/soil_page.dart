import 'dart:async';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/interactive/quizz_page1.dart';
import 'package:learning/src/interactive/soil_column_page.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/responsive.dart';
import 'package:learning/tool_widgets.dart';

class SoilPageScreen extends StatefulWidget {
  const SoilPageScreen({Key? key}) : super(key: key);
  static const routeName = '/soil_page';

  @override
  State<SoilPageScreen> createState() => _SoilPageScreenState();
}

class _SoilPageScreenState extends State<SoilPageScreen> {
  bool popUpVisible = false;
  bool popUpPortraitVisible = false;
  String title = "မြေဆီလွှာကို ဖြစ်ပေါ်စေသည့် အကြောင်းအရင်း ";
  String txt =
      "မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရင်း (၅)ခုမှာ - \n(က)  ရာသီဥတု၊\n(ခ)   သက်ရှိအကြောင်းအရာများ၊\n(ဂ)   မြေမျက်နှာသွင်ပြင်၊ \n(ဃ)  မိခင်အစိုင်အခဲ၊ \n(င)    အချိန်။";
  String imageChoosen = "assets/images/s1.png";
  String txtChoosen =
      "(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ ";

  bool selected = false;
  Timer? timer;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      setState(() {
        selected = !selected;
      });
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
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                popUpVisible = false;
                popUpPortraitVisible = false;
              });
            },
            child: Stack(
              children: [
                BackgroundPage(
                  backImage: "assets/images/agre_back.jpg",
                ),
                const SessionHeader(),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          decoration: shadowDecorationWithBorderColor(
                              const Color.fromARGB(200, 113, 101, 45),
                              const Color.fromARGB(200, 113, 101, 45),
                              12),
                          margin: EdgeInsets.only(
                            top: 68,
                            left: MediaQuery.of(context).size.width * 0.09,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.8,
                          padding: const EdgeInsets.only(
                              right: 12, top: 12, bottom: 12, left: 12),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.251,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: (() {
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             const SoilPageScreen()));
                                          setState(() {
                                            popUpVisible = true;
                                            imageChoosen =
                                                "assets/images/s1.png";
                                            txtChoosen =
                                                "(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ ";
                                          });
                                        }),
                                        child: OpacityAnimatedWidget.tween(
                                          enabled: true,
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          opacityDisabled: 0,
                                          opacityEnabled: 1,
                                          child:
                                              TranslationAnimatedWidget.tween(
                                            enabled: true,
                                            delay: const Duration(
                                                milliseconds: 1500),
                                            translationDisabled: Offset(
                                                0,
                                                Responsive.isMobile(context)
                                                    ? 20
                                                    : 40),
                                            translationEnabled:
                                                const Offset(0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text("ရာသီဥတု",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            Responsive.isMobile(
                                                                    context)
                                                                ? 16
                                                                : 14)),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: Responsive.isMobile(
                                                              context)
                                                          ? 4
                                                          : 12),
                                                  child: AnimatedContainer(
                                                    height: selected
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.11
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.093,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Image.asset(
                                                      "assets/images/m1.png",
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.11,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      Responsive.isMobile(
                                                              context)
                                                          ? 4
                                                          : 12),
                                                  child: Image.asset(
                                                    "assets/images/arrow.png",
                                                    height: Responsive.isMobile(
                                                            context)
                                                        ? 14
                                                        : 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 1,
                                    //   child: GestureDetector(
                                    //     onTap: (() {
                                    //       setState(() {
                                    //         popUpPortraitVisible = true;
                                    //         imageChoosen =
                                    //             "assets/images/s2.png";
                                    //         txtChoosen =
                                    //             "(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ";
                                    //       });
                                    //     }),
                                    //     child: OpacityAnimatedWidget.tween(
                                    //       enabled: true,
                                    //       duration: const Duration(
                                    //           milliseconds: 2000),
                                    //       opacityDisabled: 0,
                                    //       opacityEnabled: 1,
                                    //       child:
                                    //           TranslationAnimatedWidget.tween(
                                    //         enabled: true,
                                    //         delay: const Duration(
                                    //             milliseconds: 1500),
                                    //         translationDisabled: Offset(
                                    //             0,
                                    //             Responsive.isMobile(context)
                                    //                 ? 20
                                    //                 : 40),
                                    //         translationEnabled:
                                    //             const Offset(0, 0),
                                    //         child: Column(
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.center,
                                    //           children: [
                                    //             Text("သက်ရှိအကြောင်းအရာများ",
                                    //                 style: TextStyle(
                                    //                     color: Colors.white,
                                    //                     fontWeight:
                                    //                         FontWeight.w500,
                                    //                     fontSize:
                                    //                         Responsive.isMobile(
                                    //                                 context)
                                    //                             ? 16
                                    //                             : 14)),
                                    //             Padding(
                                    //               padding: EdgeInsets.only(
                                    //                   top: Responsive.isMobile(
                                    //                           context)
                                    //                       ? 4
                                    //                       : 12),
                                    //               child: AnimatedContainer(
                                    //                 height: selected
                                    //                     ? MediaQuery.of(context)
                                    //                             .size
                                    //                             .height *
                                    //                         0.11
                                    //                     : MediaQuery.of(context)
                                    //                             .size
                                    //                             .height *
                                    //                         0.093,
                                    //                 duration: const Duration(
                                    //                     seconds: 2),
                                    //                 curve: Curves.fastOutSlowIn,
                                    //                 child: Image.asset(
                                    //                   "assets/images/m2.png",
                                    //                   height:
                                    //                       MediaQuery.of(context)
                                    //                               .size
                                    //                               .height *
                                    //                           0.11,
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             Padding(
                                    //               padding: EdgeInsets.all(
                                    //                   Responsive.isMobile(
                                    //                           context)
                                    //                       ? 4
                                    //                       : 12),
                                    //               child: Image.asset(
                                    //                 "assets/images/arrow.png",
                                    //                 height: Responsive.isMobile(
                                    //                         context)
                                    //                     ? 14
                                    //                     : 24,
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: (() {
                                          setState(() {
                                            popUpVisible = true;
                                            imageChoosen =
                                                "assets/images/s3.png";
                                            txtChoosen =
                                                "(ဂ) မြေမျက်နှာသွင်ပြင်။ တောင်စောင်းအနေအထား၊ ရှုထောင့်၊ ပုံသဏ္ဍာန်";
                                          });
                                        }),
                                        child: OpacityAnimatedWidget.tween(
                                          enabled: true,
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          opacityDisabled: 0,
                                          opacityEnabled: 1,
                                          child:
                                              TranslationAnimatedWidget.tween(
                                            enabled: true,
                                            delay: const Duration(
                                                milliseconds: 1500),
                                            translationDisabled: Offset(
                                                0,
                                                Responsive.isMobile(context)
                                                    ? 20
                                                    : 40),
                                            translationEnabled:
                                                const Offset(0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text("မြေမျက်နှာသွင်ပြင်",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            Responsive.isMobile(
                                                                    context)
                                                                ? 16
                                                                : 14)),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: Responsive.isMobile(
                                                              context)
                                                          ? 4
                                                          : 12),
                                                  child: AnimatedContainer(
                                                    height: selected
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.11
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.093,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Image.asset(
                                                      "assets/images/m3.png",
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.11,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      Responsive.isMobile(
                                                              context)
                                                          ? 4
                                                          : 12),
                                                  child: Image.asset(
                                                    "assets/images/arrow.png",
                                                    height: Responsive.isMobile(
                                                            context)
                                                        ? 14
                                                        : 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.62,
                                padding: EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                    top: Responsive.isMobile(context) ? 10 : 20,
                                    bottom:
                                        Responsive.isMobile(context) ? 8 : 20),
                                decoration: shadowDecoration(
                                    const Color.fromARGB(255, 144, 207, 250)),
                                child: Center(
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: 1.1,
                                        fontSize: Responsive.isMobile(context)
                                            ? 16
                                            : 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.251,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: (() {
                                          setState(() {
                                            popUpVisible = true;
                                            imageChoosen =
                                                "assets/images/s4.png";
                                            txtChoosen =
                                                "(ဃ) မိခင်အစိုင်အခဲ။ ကျောက်ဆောင်၊ နုန်းမြေ (alluvium) (လေ သို့မဟုတ် ရေ အနယ်ကျရာမှ ဖြစ်ပေါ်လာသော အရာ)";
                                          });
                                        }),
                                        child: OpacityAnimatedWidget.tween(
                                          enabled: true,
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          opacityDisabled: 0,
                                          opacityEnabled: 1,
                                          child:
                                              TranslationAnimatedWidget.tween(
                                            enabled: true,
                                            delay: const Duration(
                                                milliseconds: 1500),
                                            translationDisabled: Offset(
                                                0,
                                                Responsive.isMobile(context)
                                                    ? -20
                                                    : -40),
                                            translationEnabled:
                                                const Offset(0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      Responsive.isMobile(
                                                              context)
                                                          ? 4
                                                          : 12),
                                                  child: Image.asset(
                                                    "assets/images/arrow_down.png",
                                                    height: Responsive.isMobile(
                                                            context)
                                                        ? 12
                                                        : 24,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          Responsive.isMobile(
                                                                  context)
                                                              ? 4
                                                              : 12),
                                                  child: AnimatedContainer(
                                                    height: !selected
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.11
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.093,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Image.asset(
                                                      "assets/images/m4.png",
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.11,
                                                    ),
                                                  ),
                                                ),
                                                Text("မိခင်အစိုင်အခဲ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            Responsive.isMobile(
                                                                    context)
                                                                ? 16
                                                                : 14)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: (() {
                                          setState(() {
                                            popUpVisible = true;
                                            imageChoosen =
                                                "assets/images/s5.png";
                                            txtChoosen =
                                                "(င) အချိန်။ မြေဆီလွှာစတင်ဖြစ်ပေါ်တဲ့ အချိန်ကစပြီး ကြာချိန်";
                                          });
                                        }),
                                        child: OpacityAnimatedWidget.tween(
                                          enabled: true,
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          opacityDisabled: 0,
                                          opacityEnabled: 1,
                                          child:
                                              TranslationAnimatedWidget.tween(
                                            enabled: true,
                                            delay: const Duration(
                                                milliseconds: 1500),
                                            translationDisabled: Offset(
                                                0,
                                                Responsive.isMobile(context)
                                                    ? -20
                                                    : -40),
                                            translationEnabled:
                                                const Offset(0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      Responsive.isMobile(
                                                              context)
                                                          ? 4
                                                          : 12),
                                                  child: Image.asset(
                                                    "assets/images/arrow_down.png",
                                                    height: Responsive.isMobile(
                                                            context)
                                                        ? 12
                                                        : 24,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          Responsive.isMobile(
                                                                  context)
                                                              ? 4
                                                              : 12),
                                                  child: AnimatedContainer(
                                                    height: !selected
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.11
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.093,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Image.asset(
                                                      "assets/images/m5.png",
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.11,
                                                    ),
                                                  ),
                                                ),
                                                Text("အချိန်",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            Responsive.isMobile(
                                                                    context)
                                                                ? 16
                                                                : 14)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Scrollbar(
                              trackVisibility: true,
                              thumbVisibility: true,
                              child: SingleChildScrollView(
                                  child: Text(
                                txt,
                                style: TextStyle(
                                    height: 1.7,
                                    color: Colors.white,
                                    fontSize:
                                        Responsive.isMobile(context) ? 16 : 19),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child:
                      Visibility(visible: popUpVisible, child: popUpWidget()),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Visibility(
                      visible: popUpPortraitVisible,
                      child: popUpWidgetPortrait()),
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
                                builder: ((context) => const QuizzPage1())));
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
                                builder: ((context) =>
                                    const SoilColumnPage())));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget popUpWidget() {
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
              const Color.fromARGB(255, 255, 216, 95), Colors.white, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, right: 36, left: 20, bottom: 8),
                    child: Center(
                      child: Image.asset(
                        imageChoosen,
                        fit: BoxFit.fill,
                        // width: MediaQuery.of(context).size.width * 0.74,
                        height: MediaQuery.of(context).size.height * 0.48,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          popUpVisible = false;
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
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                padding: const EdgeInsets.only(right: 36, left: 20),
                child: Scrollbar(
                  trackVisibility: true,
                  thumbVisibility: true,
                  controller: scrollController,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      txtChoosen,
                      style: TextStyle(
                          height: 1.7,
                          color: Colors.black,
                          fontSize: Responsive.isMobile(context) ? 16 : 19),
                    ),
                  )),
                ),
              ),
              // Container(
              //     height: MediaQuery.of(context).size.height * 0.3,
              //     padding: const EdgeInsets.only(
              //         top: 12, left: 20, bottom: 16, right: 20),
              //     child: SingleChildScrollView(
              //       child: Text(
              //         txtChoosen,
              //         textAlign: TextAlign.left,
              //         style: const TextStyle(height: 1.8, fontSize: 17),
              //       ),
              //     )),
            ],
          )),
    );
  }

  Widget popUpWidgetPortrait() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width * 0.74,
          margin: EdgeInsets.only(
              top: Responsive.isMobile(context)
                  ? 4
                  : MediaQuery.of(context).size.height * 0.15,
              bottom: Responsive.isMobile(context)
                  ? 8
                  : MediaQuery.of(context).size.height * 0.26),
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(255, 197, 231, 117), Colors.white, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, right: 36, left: 20),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.asset(
                      imageChoosen,
                      //fit: BoxFit.fill,
                      // width: MediaQuery.of(context).size.width * 0.74,
                      // height: MediaQuery.of(context).size.height * 0.9,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 16, right: 20),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            txtChoosen,
                            textAlign: TextAlign.left,
                            style: const TextStyle(height: 1.8, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            popUpPortraitVisible = false;
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
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
