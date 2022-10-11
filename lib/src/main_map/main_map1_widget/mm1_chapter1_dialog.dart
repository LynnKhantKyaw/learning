import 'dart:developer';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/main_map/main_map1_widget/mm1_chapter1_title_widget.dart';

class MM1Chapter1Dialog extends StatelessWidget {
  const MM1Chapter1Dialog({
    super.key,
    required this.closeOnTap,
  });
  final Function? closeOnTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/images/papersmall.png',
            scale: 1.5,
          ),
        ),
        Positioned(
          top: 0,
          left: size.width * 0.09,
          right: 0,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/title_leaf.png',
                scale: 2.5,
                // width: size.width * 0.3,
              ),
              Positioned(
                left: size.width * 0.1,
                top: size.height * 0.065,
                child: const Text(
                  'Chapter (1) about soil oil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 5,
          child: InkWell(
            onTap: () => closeOnTap?.call(),
            child: Image.asset(
              'assets/images/close.png',
              scale: 2,
            ),
          ),
        ),
        Positioned.fill(
          top: size.height * 0.23,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MM1Chapter1TitleWidget(
                title: '1.1 chapter',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              MM1Chapter1TitleWidget(
                title: '1.1 chapter',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              MM1Chapter1TitleWidget(
                title: '1.1 chapter',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => log('jennie'),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/check_answer.png',
                      scale: 1.6,
                    ),
                    Positioned(
                      top: size.height * 0.03,
                      left: size.width * 0.06,
                      child: const Text(
                        'Start',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
