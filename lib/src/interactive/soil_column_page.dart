import 'package:flutter/material.dart';
import 'package:learning/src/common_widget/page_pusher_button.dart';
import 'package:learning/src/interactive/soil_page.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page5.dart';
import 'package:learning/src/responsive.dart';
import 'package:learning/tool_widgets.dart';

class SoilColumnPage extends StatefulWidget {
  const SoilColumnPage({super.key});

  @override
  State<SoilColumnPage> createState() => _SoilColumnPageState();
}

class _SoilColumnPageState extends State<SoilColumnPage> {
  String imageChoosen = "assets/images/l1.png";
  String title = "မြေဆီလွှာကို ဖြစ်ပေါ်စေသည့် အကြောင်းအရင်း ";
  String txt =
      "မြေဆီလွှာကို ဖြစ်ပေါ်စေတဲ့ အကြောင်းအရင်း (၅)ခုမှာ - \n(က)  ရာသီဥတု၊\n(ခ)   သက်ရှိအကြောင်းအရာများ၊\n(ဂ)   မြေမျက်နှာသွင်ပြင်၊ \n(ဃ)  မိခင်အစိုင်အခဲ၊ \n(င)    အချိန်။";
  bool popUpVisible = false;
  bool popUpPortraitVisible = false;

  String txtChoosen =
      "(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ ";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              const BackgroundPage(),
              const SessionHeader(),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(200, 113, 101, 45),
                      const Color.fromARGB(200, 113, 101, 45),
                      12),
                  margin: const EdgeInsets.only(top: 60),
                  width: MediaQuery.of(context).size.width * 0.74,
                  height: MediaQuery.of(context).size.height * 0.54,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          margin: const EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width * 0.3,
                          // padding: EdgeInsets.only(
                          //     left: 40,
                          //     right: 40,
                          //     top: Responsive.isMobile(context) ? 10 : 20,
                          //     bottom:
                          //         Responsive.isMobile(context) ? 8 : 20),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.1,
                                  fontSize:
                                      Responsive.isMobile(context) ? 12 : 12,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              popUpVisible = true;
                              imageChoosen = "assets/images/s1.png";
                              txtChoosen =
                                  "(က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ (က) ရာသီဥတု။ အပူချိန်နဲ့ မိုးရွာသွန်းမှုက ဓာတုဓာတ်ပြုတဲ့နှုန်းကို လွှမ်းမိုးပါတယ်။ မြေဆီလွှာတွေက ပူနွေးတဲ့၊ စိုစွတ်တဲ့ နေရာတွေမှာ လျင်မြန်စွာဖြစ်ပေါ်ပြီးတော့ အေးတဲ့၊ လေတိုက်တဲ့နေရာတွေမှာ နှေးကွေးစွာ ဖြစ်ပေါ်ပါတယ်။ ";
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: size.width * .1),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //      mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'ရာသီဥတု',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Image.asset(
                                      "assets/images/m1.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.11,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                const SizedBox(width: 14),
                                Container(
                                  margin: const EdgeInsets.only(right: 28),
                                  child: Transform.rotate(
                                    angle: 80,
                                    child: Image.asset(
                                      'assets/images/arrow_down.png',
                                      height: size.height * 0.11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 150,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              popUpVisible = true;
                              imageChoosen = "assets/images/s2.png";
                              txtChoosen =
                                  "(ခ) သက်ရှိအကြောင်းအရာများ။ အပင်များ၊ တိရစ္ဆာန်များ၊ မှိုများ၊ ဘက်တီးရီးယားများနှင့် အဏုဇီဝသက်ရှိများ ";
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: size.width * .03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/m2.png",
                                      height: size.height * 0.11,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text('သက်ရှိအကြောင်းအရာများ',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  child: Transform.rotate(
                                    angle: 150,
                                    child: Image.asset(
                                      'assets/images/arrow_down.png',
                                      height: size.height * 0.11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              popUpVisible = true;
                              imageChoosen = "assets/images/s3.png";
                              txtChoosen =
                                  "(ဂ) မြေမျက်နှာသွင်ပြင်။ တောင်စောင်းအနေအထား၊ ရှုထောင့်၊ ပုံသဏ္ဍာန်";
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: size.width * .03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/m3.png",
                                        height: size.height * 0.11,
                                      ),
                                      const SizedBox(width: 5),
                                      const Text('မြေမျက်နှာသွင်ပြင်',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Transform.rotate(
                                  angle: 70,
                                  child: Image.asset(
                                    'assets/images/arrow_down.png',
                                    height: size.height * 0.11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        left: 150,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              popUpVisible = true;
                              imageChoosen = "assets/images/s4.png";
                              txtChoosen =
                                  "(ဃ) မိခင်အစိုင်အခဲ။ ကျောက်ဆောင်၊ နုန်းမြေ (alluvium) (လေ သို့မဟုတ် ရေ အနယ်ကျရာမှ ဖြစ်ပေါ်လာသော အရာ)";
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: size.width * .03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 30),
                                  child: Transform.rotate(
                                    angle: 10,
                                    child: Image.asset(
                                      'assets/images/arrow_down.png',
                                      height: size.height * 0.11,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/m4.png",
                                      height: size.height * 0.11,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text('မိခင်အစိုင်အခဲ။',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 120,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              popUpVisible = true;
                              imageChoosen = "assets/images/s5.png";
                              txtChoosen =
                                  "(င) အချိန်။ မြေဆီလွှာစတင်ဖြစ်ပေါ်တဲ့ အချိန်ကစပြီး ကြာချိန်";
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: size.width * .03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(right: size.width * .12),
                                  child: Transform.rotate(
                                    angle: 40,
                                    child: Image.asset(
                                      'assets/images/arrow_down.png',
                                      height: size.height * 0.11,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/m5.png",
                                      height: size.height * 0.11,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(' အချိန်',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                      left: 24, top: 16, bottom: 8, right: 8),
                  decoration: shadowDecorationWithBorderColor(
                      const Color.fromARGB(200, 113, 101, 45),
                      const Color.fromARGB(200, 113, 101, 45),
                      12),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                        child: Text(
                      txt,
                      style: TextStyle(
                          height: 1.7,
                          color: Colors.white,
                          fontSize: Responsive.isMobile(context) ? 16 : 19),
                    )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Visibility(visible: popUpVisible, child: popUpWidget()),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Visibility(
                    visible: popUpPortraitVisible,
                    child: popUpWidgetPortrait()),
              ),
              PagePusherButton(
                forward: true,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const SoilPageScreen()),
                      ));
                },
              ),
              PagePusherButton(
                forward: false,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LearningPage5())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget popUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 600, //MediaQuery.of(context).size.width * 0.74,
          // margin: EdgeInsets.only(
          //     top: Responsive.isMobile(context)
          //         ? 4
          //         : MediaQuery.of(context).size.height * 0.15,
          //     bottom: Responsive.isMobile(context)
          //         ? 8
          //         : MediaQuery.of(context).size.height * 0.26),
          decoration: shadowDecorationWithBorderColor(
              const Color.fromARGB(255, 255, 216, 95), Colors.white, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12.0, right: 36, left: 20),
                    child: Center(
                      child: Image.asset(
                        imageChoosen,
                        //fit: BoxFit.fill,
                        // width: MediaQuery.of(context).size.width * 0.74,
                        height: MediaQuery.of(context).size.height * 0.63,
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
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.only(
                      top: 12, left: 20, bottom: 16, right: 20),
                  child: SingleChildScrollView(
                    child: Text(
                      txtChoosen,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          height: 1.8, fontSize: 17, color: Colors.black),
                    ),
                  )),
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
