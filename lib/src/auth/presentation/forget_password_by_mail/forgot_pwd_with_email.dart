import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/src/auth/presentation/forget_password_by_mail/forgot_password_code.dart';

class ForgotPasswordWithEmail extends StatelessWidget {
  const ForgotPasswordWithEmail({super.key});
  static const route = 'ForgotPasswordWithEmailRoute';
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
                left: MediaQuery.of(context).size.width * 0.3,
                top: MediaQuery.of(context).size.height * 0.32,
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/wooden_six.png",
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.62,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Image.asset(
                      "assets/images/paper_medium_leafs.png",
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.54,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3,
                top: MediaQuery.of(context).size.height * 0.2,
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
              top: 60,
              child: Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.28,
                  right: MediaQuery.of(context).size.width * 0.28,
                  top: MediaQuery.of(context).size.width * 0.14,
                  bottom: MediaQuery.of(context).size.height * 0.15,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const Text(
                        'Password ပြောင်းမည့် Email account ကိုထည့်သွင်းပေးပါ ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Material(
                          elevation: 2,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              filled: true,
                              isDense: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      BouncingWidget(
                        duration: const Duration(milliseconds: 400),
                        scaleFactor: 1.5,
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordCode(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/button_green_round.png",
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 16,
                                left: 42,
                              ),
                              child: Text(
                                "Send",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
