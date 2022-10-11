import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                  'Chapter 1 good soil and oil blah hapter 1 good soil and   ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
