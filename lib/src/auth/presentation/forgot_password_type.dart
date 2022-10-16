import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/auth/presentation/common/pwd_change_email_reusable_scaffold.dart';
import 'package:learning/src/auth/presentation/forget_password_by_mail/forgot_pwd_with_email.dart';
import 'package:learning/src/auth/presentation/forgot_password_by_question/forgot_pwd_with_question.dart';
import 'package:learning/src/main_map/main_map1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordTypeScreen extends StatefulWidget {
  static const routeName = '/forgot_password_type';
  const ForgotPasswordTypeScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordTypeScreen> createState() =>
      _ForgotPasswordTypeScreenState();
}

class _ForgotPasswordTypeScreenState extends State<ForgotPasswordTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return PwdChangeEmailScaffold(
      topPadding: 75,
      child: Column(
        children: [
          const Text(
            'Password ပြောင်းမည်',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordWithEmail(),
                        ),
                      );
                    },
                    child: const Text('Email'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPwdWithQuestion(),
                        ),
                      );
                    },
                    child: const Text('Question'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  register(
      BuildContext context,
      String name,
      String password,
      String passwordConfirm,
      String email,
      String phone,
      String dob,
      String state,
      String userType,
      String profession) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'content-type': 'application/json',
    };

    log('https://wwf.360ed.com/api/login');
    final response =
        await http.post(Uri.parse('https://wwf.360ed.com/api/login'),
            headers: headers,
            body: jsonEncode(<String, String>{
              'username': name,
              'password': password,
              'password_confirmation': passwordConfirm,
              'email': email,
              'phone': phone,
              'dob': dob,
              'state': state,
              'user_type': userType,
              'profession': profession,
              'device_token': 'test'
            }));
    log(jsonEncode(<String, String>{
      'username': name,
      'password': password,
      'password_confirmation': passwordConfirm,
      'email': email,
      'phone': phone,
      'dob': dob,
      'state': state,
      'user_type': userType,
      'profession': profession,
    }));
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      AuthResponse data = AuthResponse.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", data.apiToken.toString());
      prefs.setString("name", data.user!.userName!.toString());
      prefs.setString("age", data.user!.age!.toString());
      prefs.setString("phone", data.user!.phone!.toString());
      prefs.setString("email", data.user!.email!.toString());
      prefs.setString("profession", data.user!.profession!.toString());

      prefs.setString("user_type", data.user!.userType!.toString());
      prefs.setString("last_login", data.user!.lastLogin!.toString());
      prefs.setString(
          "is_email_verified", data.user!.isEmailVerified!.toString());
      prefs.setString("updated_at", data.user!.updatedAt!.toString());
      prefs.setString("created_at", data.user!.createdAt!.toString());
      prefs.setString("s_id", data.user!.sId!.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainMapFirstScreen()),
      );
    }
  }
}
