import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class IntroListWidget extends StatelessWidget {
  const IntroListWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String? title;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Container(
        margin: const EdgeInsets.only(top: 8, right: 10),
        width: double.infinity,
        height: 60,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.indigo),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '...',
            
              style: const TextStyle(color: Colors.black),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 28,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
