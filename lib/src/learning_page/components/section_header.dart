import 'package:flutter/material.dart';
import 'package:learning/src/library/library_main.dart';
import 'package:learning/src/responsive.dart';
import 'package:learning/tool_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 48,
          color: const Color.fromARGB(255, 175, 159, 71),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 2),
                  child: Text(
                    "၁.၁။ မြေဆီလွှာ ဆိုသည်မှာ အဘယ်နည်း။",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 42, left: MediaQuery.of(context).size.width * 0.15),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width * 0.7,
            animation: true,
            lineHeight: Responsive.isMobile(context) ? 8 : 12,
            animationDuration: 1000,
            percent: 0.4,
            center: Text(
              "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Responsive.isMobile(context) ? 16 : 15),
            ),
            barRadius: const Radius.circular(14),
            progressColor: Colors.yellow,
            backgroundColor: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 6),
              child: Row(children: [
                Image.asset(
                  "assets/images/back.png",
                  width: 36,
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  "assets/images/home.png",
                  width: 36,
                )
              ]),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 12, top: 6),
          child: Align(
            alignment: Alignment.topRight,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LibraryMain(),
                  ));
                },
                child: Image.asset(
                  "assets/images/library.png",
                  width: 36,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 36,
                width: 36,
                // margin: const EdgeInsets.only(bottom: 12, left: 20),
                decoration: shadowDecoration(Colors.white),

                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
