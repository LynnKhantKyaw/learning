import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MM1Chapter1TitleWidget extends StatelessWidget {
  const MM1Chapter1TitleWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String? title;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: size.width * 0.5,
        height: 50,
        child: Text(title ?? '...'),
      ),
    );
  }
}
