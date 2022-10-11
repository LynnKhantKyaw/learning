import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 35,
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    'Chapter ${index + 1}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: ScrollController(),
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            margin: const EdgeInsets.only(right: 5),
                            width: 120,
                            color: Colors.green,
                            child: Text(
                              'Chapter  ${index + 1}',
                              style: const TextStyle(color: Colors.black),
                            ),
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
