import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/auth/presentation/common/pwd_change_email_reusable_scaffold.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return PwdChangeEmailScaffold(
      topPadding: 66,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  height: .5,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
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
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 14,
                  height: .5,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
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
          const SizedBox(height: 10),
          BouncingWidget(
            duration: const Duration(milliseconds: 400),
            scaleFactor: 1.5,
            onPressed: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PasswordChange(),
              //   ),
              // );
            },
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/button_green_round.png",
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 50,
                  fit: BoxFit.fill,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 42,
                  ),
                  child: Text(
                    "Change Password",
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
    );
  }
}
