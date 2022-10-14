import 'dart:convert';
import 'dart:developer';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/main_map/main_map1.dart';
import 'package:learning/tool_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterNameScreen extends StatefulWidget {
  static const routeName = '/register_name';
  const RegisterNameScreen({Key? key}) : super(key: key);

  @override
  State<RegisterNameScreen> createState() => _RegisterNameScreenState();
}

class _RegisterNameScreenState extends State<RegisterNameScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? stateSelected;
  List<String> stateItems = ["Manager", "Supervisor", "Staff", "Sale Staff"];

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
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
                  left: MediaQuery.of(context).size.width * 0.2,
                  top: 50,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/wooden_six.png",
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.82,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Image.asset(
                        "assets/images/paper_medium_leafs.png",
                        width: MediaQuery.of(context).size.width * 0.62,
                        height: MediaQuery.of(context).size.height * 0.74,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.24,
                  top: 12,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/title_leaf.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 60, top: 32),
                      child: Text(
                        "Create New Account/အကောင့်သစ် ဖွင့်မယ်",
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
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.28,
                    right: MediaQuery.of(context).size.width * 0.28,
                    top: MediaQuery.of(context).size.width * 0.14,
                    bottom: MediaQuery.of(context).size.height * 0.15),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                      ),
                      controller: userNameController,
                      decoration: InputDecoration(
                        labelText: "User Name/အသုံးပြုသူအမည်",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                      ),
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password/လျှို့ဝှက်နံပါတ်",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                      ),
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: "Confirm Password/လျှို့ဝှက်နံပါတ်",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 0, right: 0, top: 12, bottom: 12),
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          "State/Region/ နေထိုင်ရာဒေသ",
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 48,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        items: stateItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return "Please Select Role";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            stateSelected = value.toString();
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            stateSelected = value.toString();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BouncingWidget(
                      duration: const Duration(milliseconds: 400),
                      scaleFactor: 1.5,
                      onPressed: () async {
                        login(context, "sithuaung", "123456");
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
                    Container(
                      decoration: shadowDecorationWithBorderColor(
                          const Color.fromARGB(200, 113, 101, 45),
                          const Color.fromARGB(180, 113, 101, 45),
                          12),
                      margin: const EdgeInsets.only(top: 10),
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
                  ],
                ),
              ),
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
    final response = await http.post(
        Uri.parse('https://wwf.360ed.com/api/login'),
        headers: headers,
        body: jsonEncode(<String, String>{
          'username': name,
          'password': password,
          'device_token': 'test'
        }));
    log(jsonEncode(<String, String>{
      'phone': name,
      'password': password,
      'device_token': 'test'
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