import 'dart:developer';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/components/book_list.dart';
import 'package:learning/src/components/menu_list.dart';
import 'package:learning/src/components/video_list.dart';
import 'package:learning/src/learning_page/learning_paeg0.dart';
import 'package:learning/src/learning_page/learning_page1.dart';
import 'package:learning/src/main_map/main_map1_widget/mm1_chapter1_dialog.dart';
import 'package:learning/src/main_map/main_map2.dart';
import 'package:learning/src/main_map/main_map3.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainMapFirstScreen extends StatefulWidget {
  const MainMapFirstScreen({Key? key}) : super(key: key);

  @override
  State<MainMapFirstScreen> createState() => _MainMapFirstScreenState();
}

class _MainMapFirstScreenState extends State<MainMapFirstScreen> {
  bool folded = true;
  bool mm1ChapterDialog = false;
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
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/farm.png",
                      width: 1500,
                    ),
                    titleSubject(
                        "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ", 490, 70),

                    Positioned(
                      left: 294,
                      top: 280,
                      child: Image.asset(
                        "assets/images/f1.png",
                        height: 166,
                      ),
                    ),

                    subjectText(
                      "၁။ အခြေခံမြေဆီလွှာနှင့် \n  ကောင်းမွန်သော \n  မြေဆီလွှာအကြောင်း",
                      138,
                      80,
                      294,
                      210,
                    ),
                    subjectIcon(
                      "assets/images/target1.png",
                      40,
                      390,
                      300,
                    ),
                    percentIndicator(0.5, 80, 8, 374, 350),
                    //House 1
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      550,
                      310,
                    ),
                    chapterText(
                      "၁.၁။ မြေဆီလွှာ \n အကြောင်းအခြေခံ ",
                      110,
                      54,
                      456,
                      262,
                    ),
                    percentIndicator(
                      0.7,
                      80,
                      7,
                      544,
                      374,
                    ),

                    //farm 1
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      642,
                      284,
                    ),
                    chapterText(
                      "၁.၂။ မြေဆီလွှာ၏ \nရုပ်ဂုဏ်သတ္တိများ",
                      100,
                      48,
                      574,
                      246,
                    ),
                    percentIndicator(
                      0.7,
                      80,
                      7,
                      634,
                      336,
                    ),

                    //House 2
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      670,
                      180,
                    ),
                    chapterText(
                      "၁.၃။ မြေဆီလွှာ၏ ဓာတ်ဂုဏ်သတ္တိများ",
                      100,
                      48,
                      590,
                      140,
                    ),
                    percentIndicator(
                      0.7,
                      80,
                      7,
                      664,
                      230,
                    ),

                    //farm 2
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      772,
                      144,
                    ),
                    chapterText(
                      "၁.၄။ မြေဆီလွှာရှိ \nသဘာဝမြေဆွေး",
                      100,
                      48,
                      694,
                      94,
                    ),
                    percentIndicator(
                      0.7,
                      80,
                      7,
                      764,
                      194,
                    ),

                    //House 3
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      840,
                      212,
                    ),
                    chapterText(
                      "၁.၅။ မြေဆီလွှာရှိ \nအဏုဇီဝပိုးမွှားများ",
                      100,
                      48,
                      780,
                      184,
                    ),
                    percentIndicator(
                      0.7,
                      80,
                      7,
                      834,
                      264,
                    ),

                    //farm 3
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      818,
                      328,
                    ),
                    chapterText(
                      "၁.၆။ ကောင်းမွန်သော \nမြေဆီလွှာ",
                      110,
                      48,
                      740,
                      288,
                    ),
                    percentIndicator(
                      0.7,
                      80,
                      7,
                      814,
                      376,
                    ),

                    //Chapter 2

                    chapterButton(
                      "assets/images/f3.png",
                      112,
                      984,
                      560,
                    ),
                    subjectText(
                      "၃။ ရေကို အကျိုးရှိစွာ \nအသုံးပြုခြင်း",
                      128,
                      60,
                      944,
                      520,
                    ),

                    //farm 1
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      920,
                      674,
                    ),
                    chapterText(
                      " ၃.၁။ မိတ်ဆက်ခြင်း",
                      108,
                      32,
                      836,
                      648,
                    ),
                    keyLock(
                      24,
                      940,
                      688,
                    ),

                    //House 1
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      834,
                      616,
                    ),
                    chapterText(
                      "၃.၂။ ရေ၏ အရည်အသွေး",
                      128,
                      32,
                      760,
                      588,
                    ),
                    keyLock(
                      24,
                      850,
                      634,
                    ),

                    //Farm 2
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      890,
                      526,
                    ),
                    chapterText(
                      "၃.၃။ မိုးကောင်းသောက်စိုက်ပျိုးရေးတွင် \nရေကို အကျိုးရှိစွာအသုံးပြုခြင်း",
                      186,
                      50,
                      740,
                      488,
                    ),
                    keyLock(
                      24,
                      910,
                      534,
                    ),

                    //House 2
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      844,
                      426,
                    ),
                    chapterText(
                      "၃.၄။ အကျိုးထိရောက်မှုရှိသော\nရေသွင်းခြင်း",
                      152,
                      44,
                      786,
                      400,
                    ),
                    keyLock(
                      24,
                      852,
                      448,
                    ),

                    // Farm 3
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      724,
                      396,
                    ),
                    chapterText(
                      "၃.၅။ ရေစုဆောင်းခြင်းနှင့် \nထိန်းသိမ်းခြင်း",
                      132,
                      40,
                      624,
                      366,
                    ),
                    keyLock(
                      24,
                      742,
                      408,
                    ),

                    //House 3
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      610,
                      456,
                    ),
                    chapterText(
                      "၃.၆။ စိုက်ပျိုးမှုစနစ်များတွင် \nရေကိုအကျိုးရှိစွာအသုံးပြုခြင်းအတွက်\nဘက်ပေါင်းစုံနည်းစနစ်များ",
                      182,
                      74,
                      450,
                      400,
                    ),
                    keyLock(
                      24,
                      620,
                      478,
                    ),

                    //Chapter 4
                    chapterButton(
                      "assets/images/f4.png",
                      156,
                      570,
                      500,
                    ),
                    subjectText(
                      "၄။ မတူကွဲပြားခြားနားသော \nသီးနှံစိုက်ပျိုးနည်းစနစ်များ",
                      158,
                      60,
                      570,
                      520,
                    ),

                    //farm 1
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      500,
                      632,
                    ),
                    chapterText(
                      "၄.၄။ သီးနှံသစ်တော \nရောနှောစနစ်",
                      110,
                      44,
                      430,
                      600,
                    ),
                    keyLock(
                      24,
                      520,
                      648,
                    ),

                    //House 1
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      724,
                      650,
                    ),
                    chapterText(
                      "၄.၁။ သီးနှံစိုက်ပျိုးနည်းစနစ်များ",
                      148,
                      32,
                      610,
                      628,
                    ),
                    keyLock(
                      24,
                      734,
                      668,
                    ),

                    //House 2
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      544,
                      720,
                    ),
                    chapterText(
                      "၄.၃။ သီးညှပ်စိုက်ပျိုးခြင်း",
                      128,
                      32,
                      460,
                      698,
                    ),
                    keyLock(
                      24,
                      554,
                      738,
                    ),

                    //House 2
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      404,
                      670,
                    ),
                    chapterText(
                      "၄.၅။ သီးနှံပြက္ခဒိန်",
                      110,
                      32,
                      320,
                      658,
                    ),
                    keyLock(
                      24,
                      414,
                      688,
                    ),

                    //farm 2
                    chapterButton(
                      "assets/images/f8.png",
                      46,
                      630,
                      752,
                    ),
                    chapterText(
                      "၄.၂။ သီးလှည့်စိုက်ပျိုးနည်းစနစ်",
                      152,
                      32,
                      580,
                      730,
                    ),
                    keyLock(
                      24,
                      650,
                      768,
                    ),

                    //404,
                    //  670,
                    //Chapter 4
                    chapterButton(
                      "assets/images/f5.png",
                      106,
                      364,
                      744,
                    ),
                    subjectText(
                      "၅။ ဘက်ပေါင်းစုံ \nလယ်ယာစီမံခန့်ခွဲမှု",
                      118,
                      60,
                      248,
                      764,
                    ),

                    //House 1
                    chapterButton(
                      "assets/images/fhl.png",
                      64,
                      464,
                      840,
                    ),
                    chapterText(
                      "၅.၁။ ဘက်ပေါင်းစုံ \nလယ်ယာစီမံခန့်ခွဲမှု",
                      110,
                      52,
                      440,
                      838,
                    ),
                    keyLock(
                      24,
                      474,
                      868,
                    ),
                  ],
                ),
              ),
            ),

            //Stable
            Positioned(
              left: 20,
              top: 8,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/wooden_small.png",
                    width: MediaQuery.of(context).size.width * 0.23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/frame1.png",
                          width: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "Phyu Thant",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/ic_trophy.png",
                                    width: 18,
                                    color:
                                        const Color.fromARGB(255, 82, 57, 59)),
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset("assets/images/ic_trophy.png",
                                    width: 18,
                                    color:
                                        const Color.fromARGB(255, 82, 57, 59)),
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset("assets/images/ic_trophy.png",
                                    width: 18,
                                    color:
                                        const Color.fromARGB(255, 82, 57, 59)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              left: folded ? -70 : 0,
              top: 90,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/wooden_social.png",
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 12),
                    child: Image.asset(
                      "assets/images/paper_back.png",
                      height: MediaQuery.of(context).size.height * 0.53,
                    ),
                  ),
                  Positioned(
                    left: folded ? 82 : 22,
                    top: 24,
                    child: Visibility(
                      visible: folded,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 24,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 24,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 24,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "assets/images/frame2.png",
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: folded ? 66 : 134,
              top: MediaQuery.of(context).size.height * 0.43,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  log("Print");
                  setState(() {
                    folded = !folded;
                  });
                },
                child: Image.asset(
                  "assets/images/triangle.png",
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ),
            ),

            BouncingWidget(
              duration: const Duration(milliseconds: 400),
              scaleFactor: 1.5,
              onPressed: () async {
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainMapSecondScreen()));
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: 0, left: MediaQuery.of(context).size.width * 0.31),
                padding: const EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width * 0.15,
                height: 104,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/mb1.png",
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 20, left: 16),
                    //   child: Text(
                    //     "Developing and\nStrengthening\nFarmer Associations",
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //         color: Colors.white, height: 1.3, fontSize: 10),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            BouncingWidget(
              duration: const Duration(milliseconds: 400),
              scaleFactor: 1.5,
              onPressed: () async {
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainMapThirdScreen()));
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: 4, left: MediaQuery.of(context).size.width * 0.525),
                padding: const EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width * 0.15,
                height: 104,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/mb3.png",
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 20, left: 16),
                    //   child: Text(
                    //     "Substainable \nNatural Rubber",
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //         color: Colors.white, height: 1.3, fontSize: 10),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 38, left: MediaQuery.of(context).size.width * 0.4),
              padding: const EdgeInsets.only(top: 22),
              width: MediaQuery.of(context).size.width * 0.16,
              height: 86,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/mb2.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ \nအလေ့အထများ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, height: 1.3, fontSize: 9),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.365,
              top: 0,
              child: Image.asset(
                "assets/images/center_title.png",
                width: MediaQuery.of(context).size.width * 0.235,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 4, left: MediaQuery.of(context).size.width * 0.41),
              padding: const EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width * 0.15,
              height: 60,
              child: const Text(
                "WWF App",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, height: 1.3, fontSize: 16),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.82,
              top: 8,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {},
                child: Image.asset(
                  "assets/images/ic_noti.png",
                  width: 56,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.9,
              top: 8,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuListScreen()));
                },
                child: Image.asset(
                  "assets/images/ic_menu.png",
                  width: 56,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.82,
              top: MediaQuery.of(context).size.height * 0.83,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BookListByModuleScreen()));
                },
                child: Image.asset(
                  "assets/images/ic_book.png",
                  width: 56,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.9,
              top: MediaQuery.of(context).size.height * 0.83,
              child: BouncingWidget(
                duration: const Duration(milliseconds: 400),
                scaleFactor: 1.5,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const VideoListByModuleScreen()));
                },
                child: Image.asset(
                  "assets/images/ic_media.png",
                  width: 56,
                ),
              ),
            ),
            //1.1 chapter popup
            Visibility(
              visible: mm1ChapterDialog,
              child: Positioned(
                left: MediaQuery.of(context).size.width * 0.2,
                top: MediaQuery.of(context).size.height * 0.1,
                child: MM1Chapter1Dialog(
                  closeOnTap: () {
                    setState(() {
                      mm1ChapterDialog = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyLock(double width, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Image.asset(
        "assets/images/key_lock.png",
        color: Colors.yellow,
        width: width,
      ),
    );
  }

  Widget percentIndicator(
      double percent, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: LinearPercentIndicator(
        width: width,
        animation: true,
        lineHeight: height,
        animationDuration: 1000,
        percent: percent,
        center: const Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        barRadius: const Radius.circular(14),
        progressColor: Colors.yellow,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget chapterText(
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LearningPage1()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(100, 255, 255, 255),
              const Color.fromARGB(100, 255, 255, 255),
              20),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          width: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget subjectText(
      String text, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LearningPage0()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(100, 255, 255, 255), Colors.yellow, 20),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          width: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget chapterButton(String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              setState(() {
                mm1ChapterDialog = !mm1ChapterDialog;
              });
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const LearningPage1()));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget subjectIcon(String image, double size, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: size,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LearningPage0()));
            });
          },
          child: Image.asset(
            image,
            height: size,
          ),
        ),
      ),
    );
  }

  Widget titleSubject(String text, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedContainer(
        height: 56,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: BouncingWidget(
          duration: const Duration(milliseconds: 400),
          scaleFactor: 1.5,
          onPressed: () async {},
          child: Stack(
            children: [
              Image.asset(
                "assets/images/title_leaf.png",
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, top: 14),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
