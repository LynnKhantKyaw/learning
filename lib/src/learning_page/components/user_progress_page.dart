import 'package:flutter/material.dart';
import 'package:learning/src/util/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserProgress extends StatelessWidget {
  const UserProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 50,
              //color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      'အခန်း ${Util.intToMM(index + 1)}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: ScrollController(),
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index2) {
                          return LinearPercentIndicator(
                            width: 120,
                            animation: true,
                            lineHeight: 34,
                            animationDuration: 1000,
                            percent: 0.9,
                            center: Text(
                              "အခန်း  ${Util.intToMM(index + 1)}.${Util.intToMM(index2 + 1)}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            barRadius: const Radius.circular(4),
                            progressColor: Colors.green,
                            backgroundColor: Colors.white,
                          );
                        }),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
