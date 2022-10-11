import 'package:flutter/material.dart';

class SectionIntroHearder extends StatelessWidget {
  const SectionIntroHearder({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              'assets/images/arrow_left.png',
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/titlenoleaf.png',
                width: size.width * .65,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * .65,
                child: const Text(
                  '၁။ အခြေခံမြေဆီလွှာ နှင့် ကောင်းမွန်သောမြေဆီလွှာ အကြောင်း',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/ic_menu.png',
            height: 50,
          ),
        ],
      ),
    );
  }
}
