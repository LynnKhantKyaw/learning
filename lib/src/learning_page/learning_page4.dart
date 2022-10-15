import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_header.dart';
import 'package:learning/src/learning_page/learning_page3.dart';
import 'package:learning/src/learning_page/learning_page5.dart';
import 'package:learning/src/responsive.dart';

import '../../tool_widgets.dart';

class LearningPage4 extends StatefulWidget {
  const LearningPage4({Key? key}) : super(key: key);

  @override
  State<LearningPage4> createState() => _LearningPage4State();
}

class _LearningPage4State extends State<LearningPage4> {
  String txt =
      "မြေကြီးရဲ့ အခြား ရုပ်ဂုဏ်သတ္တိတွေကတော့ - \n(၁) အလေးချိန်နဲ့ သိပ်သည်းဆ  \n(၂) မြေကြီးတွင် နေရာလပ်များ/ လေရှူပေါက်များ ပါဝင်မှု \n(၃) မြေကြီးရဲ့ စိမ့်ဝင်နိုင်မှု \n(၄) မြေကြီးရဲ့ အပူချိန်နဲ့ \n(၅) မြေကြီးရဲ့ ပုံစံပြောင်းနိုင်မှု၊ အဖိအသိပ်ခံနိုင်မှုနဲ့ တိုက်စားခံနိုင်မှု တို့ဖြစ်ပါတယ်။";

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
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: 20,
                  bottom: 8,
                  top: 68,
                ),
                padding: const EdgeInsets.only(
                    left: 24, top: 24, bottom: 8, right: 8),
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
                              fontSize: Responsive.isMobile(context) ? 16 : 19),
                        )),
                      ),
                    ),
                  ],
                )),
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
                            builder: ((context) => const LearningPage5())));
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
                            builder: ((context) => const LearningPage3())));
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
