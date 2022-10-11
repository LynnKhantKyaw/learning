import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TitleContianer extends StatelessWidget {
  const TitleContianer({
    super.key,
    required this.onTap,
    required this.bgColor,
    required this.title,
  });
  final String? title;
  final Function? onTap;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          color:bgColor,
          child: Text(
            title ?? '...',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
