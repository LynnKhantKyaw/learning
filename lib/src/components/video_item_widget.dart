import 'package:flutter/material.dart';

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
  });
  final String? title;
  final String? index;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10, left: 12),
            width: MediaQuery.of(context).size.width * 0.23,
            height: 110,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: index == "0"
                    ? Colors.white
                    : index == "1"
                        ? const Color.fromARGB(255, 36, 230, 191)
                        : const Color.fromARGB(255, 243, 230, 118)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10, left: 12),
            width: MediaQuery.of(context).size.width * 0.23,
            height: 72,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white.withOpacity(0.2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '...',
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  "Module ${int.parse(index.toString()) + 1}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
