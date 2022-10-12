import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/intro_list_widget.dart';
import 'package:learning/src/learning_page/learning_page1.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    String str =
        "မြေဆီလွှာဖြစ်ပေါ်လာပုံ၊ မြေဆီလွှာတွင် ပါဝင်ဖွဲ့စည်းထားသော အရာများ၊ စိုက်ပျိုးရေးကို အဓိကသက်ရောက်မှု ဖြစ်စေသော မြေဆီလွှာ၏ ရုပ်ဂုဏ်သတ္တိနှင့် ဓာတ်ဂုဏ်သတ္တိများ၏ အကြောင်းကို နားလည်စေရန်။မြေဆီလွှာရှိ အဏုဇီဝပိုးမွှားများ၊ သဘာဝမြေဆီမြေနှစ် ကောင်းမွန်သော မြေဆီလွှာတို့၏ အရေးပါသောအခန်းကဏ္ဍများအကြောင်းကို သိရှိစေရန်။";

    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  str,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return IntroListWidget(
                    title: '1.${index + 1}  Chapter 1.${index + 1}',
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LearningPage1())));
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
