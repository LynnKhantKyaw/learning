import 'package:flutter/material.dart';
import 'package:learning/src/components/video_item_widget.dart';

class VideoItemsPage extends StatelessWidget {
  int index1;
  VideoItemsPage({super.key, required this.index1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: index1 == 0
              ? 3
              : index1 == 1
                  ? 2
                  : 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VideoItemWidget(
              title: '1.1 Chapter 1.1',
              index: index1.toString(),
              onTap: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => const LearningPage1())));
              },
            );
          }),
    );
  }
}
