import 'package:flutter/material.dart';

class IntroListWidget extends StatefulWidget {
  const IntroListWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String? title;
  final Function? onTap;

  @override
  State<IntroListWidget> createState() => _IntroListWidgetState();
}

class _IntroListWidgetState extends State<IntroListWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap?.call(),
      child: Container(
        margin: const EdgeInsets.only(top: 8, right: 10),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(2555, 76, 80, 117)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title ?? '...',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Divider(
                  color: Colors.black,
                ),
                Text("1.1")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
