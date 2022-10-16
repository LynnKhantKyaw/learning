import 'dart:convert';
import 'dart:developer';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/auth/presentation/forgot_password_type.dart';
import 'package:learning/src/auth/presentation/register_name.dart';
import 'package:learning/src/main_map/main_map1.dart';
import 'package:learning/tool_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/app_back.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/wooden_four.png",
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.75,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Image.asset(
                        "assets/images/paper_medium_leafs.png",
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.67,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.65,
                  top: 26,
                ),
                child: Image.asset(
                  "assets/images/app_logo.png",
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.53,
                  top: MediaQuery.of(context).size.height * 0.47,
                ),
                child: Image.asset(
                  "assets/images/wooden_small.png",
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.56,
                  top: MediaQuery.of(context).size.height * 0.49,
                ),
                child: Image.asset(
                  "assets/images/papersmall.png",
                  width: MediaQuery.of(context).size.width * 0.31,
                  height: 86,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.58,
                  top: MediaQuery.of(context).size.height * 0.51,
                ),
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterNameScreen()),
                    );
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/button_green_round.png",
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: 68,
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 32, top: 16),
                        child: Text(
                          "Create New Account\nအကောင့်သစ်ဖွင့်မယ်",
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.48,
                  top: MediaQuery.of(context).size.height * 0.46,
                ),
                child: Image.asset(
                  "assets/images/wooden_ring_2.png",
                  width: 68,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.11,
                  top: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/title_leaf.png",
                      width: MediaQuery.of(context).size.width * 0.38,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70, top: 24),
                      child: Text(
                        "Login/လော့ဂ်အင် ဝင်မယ်",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            height: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.16,
                  top: MediaQuery.of(context).size.width * 0.15,
                ),
                child: SizedBox(
                  width: 200,
                  height: 42,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLength: 11,
                    // style: const TextStyle(
                    //   height: 1.0,
                    //   color: Colors.black,
                    // ),
                    controller: userNameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "User Name/အသုံးပြုသူအမည်",
                      labelStyle: TextStyle(color: Colors.black),
                      counterText: "",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.16,
                  top: MediaQuery.of(context).size.width * 0.21,
                ),
                child: SizedBox(
                  width: 200,
                  height: 42,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLength: 11,
                    style: const TextStyle(
                      height: 1.0,
                      color: Colors.black,
                    ),
                    controller: passwordController,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "Password/လျှို့ဝှက်နံပါတ်",
                      labelStyle: TextStyle(color: Colors.black),
                      counterText: "",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.16,
                  top: MediaQuery.of(context).size.width * 0.28,
                ),
                child: BouncingWidget(
                  duration: const Duration(milliseconds: 400),
                  scaleFactor: 1.5,
                  onPressed: () async {
                    login(context, "satwaihlaing", "barlarlar");
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/button_green_round.png",
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: 54,
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 32, top: 16),
                        child: Text(
                          "Login/လော့ဂ်အင် ဝင်မယ်",
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  top: MediaQuery.of(context).size.width * 0.28,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ForgotPasswordTypeScreen()),
                    );
                  },
                  child: Container(
                    decoration: shadowDecorationWithBorderColor(
                        const Color.fromARGB(200, 113, 101, 45),
                        const Color.fromARGB(180, 113, 101, 45),
                        12),
                    margin: const EdgeInsets.only(top: 60),
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 52,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        "Forgot Password?\nလျှို့ဝှက်နံပါတ် မေ့နေလား?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  login(BuildContext context, String name, String password) async {
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
              'device_token': 'erferferferferferferferfe'
            }));
    log(jsonEncode(<String, String>{
      'username': name,
      'password': password,
      'device_token': 'test'
    }));
    log(response.statusCode.toString());
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
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainMapFirstScreen()),
        );
      }
    }
  }
}
