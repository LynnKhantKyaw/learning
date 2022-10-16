import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PwdChangeEmailScaffold extends StatelessWidget {
  const PwdChangeEmailScaffold({
    super.key,
    required this.child,
    this.topPadding = 60,
    this.isQuestion = false,
  });
  final Widget child;
  final double topPadding;
  final bool isQuestion;
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/app_back.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Image.asset(
                  "assets/images/back.png",
                  width: 36,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width *
                    (isQuestion ? 0.18 : 0.3),
                top: MediaQuery.of(context).size.height *
                    (isQuestion ? 0.25 : 0.32),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/wooden_six.png",
                    width: MediaQuery.of(context).size.width *
                        (isQuestion ? 0.7 : 0.42),
                    height: MediaQuery.of(context).size.height *
                        (isQuestion ? 0.72 : 0.62),
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Image.asset(
                      "assets/images/paper_medium_leafs.png",
                      width: MediaQuery.of(context).size.width *
                          (isQuestion ? 0.7 : 0.42),
                      height: MediaQuery.of(context).size.height *
                          (isQuestion ? 0.66 : 0.54),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3,
                top: MediaQuery.of(context).size.height *
                    (isQuestion ? 0.15 : 0.2),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/title_leaf.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: topPadding,
              child: Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.28,
                  right: MediaQuery.of(context).size.width * 0.28,
                  top: MediaQuery.of(context).size.width * 0.14,
                  bottom: MediaQuery.of(context).size.height * 0.11,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: isQuestion ? 15 : 50),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
