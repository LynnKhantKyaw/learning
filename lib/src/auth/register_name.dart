import 'dart:convert';
import 'dart:developer';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/main_map/main_map1.dart';
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
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final professionalController = TextEditingController();
  String? stateSelected;
  String? categorySelected;
  bool isTerAndConditionAggress = false;
  //State and Region of Myanmar
  List<String> categoryItems = ["Farmer", "Instructor"];
  List<String> stateItems = [
    "ကချင်ပြည်နယ်",
    "ကယားပြည်နယ်",
    "ကရင်ပြည်နယ်",
    "ချင်းပြည်နယ်",
    "မွန်ပြည်နယ်",
    "ရခိုင်ပြည်နယ်",
    "ရှမ်းပြည်နယ်",
    "စစ်ကိုင်းတိုင်း",
    "တနင်္သာရီတိုင်း",
    "ပဲခူးတိုင်း",
    "မကွေးတိုင်း",
    "မန္တလေးတိုင်း",
    "ရန်ကုန်တိုင်း",
    "ဧရာဝတီတိုင်း",
    "မြန်မာနိုင်ငံပြင်ပ"
  ];

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
                            return "Please Select State/Region";
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
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                      ),
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email/အီးမေးလ်",
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
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone/ဖုန်းနံပါတ်",
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
                          "Category/ အမျိုးအစား",
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
                        items: categoryItems
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
                            return "Please Select Category";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            categorySelected = value.toString();
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            categorySelected = value.toString();
                          });
                        },
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                      ),
                      controller: professionalController,
                      decoration: InputDecoration(
                        labelText: "Professional/အသက်မွေးဝမ်းကျောင်းအလုပ်",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isTerAndConditionAggress,
                            onChanged: (value) {
                              setState(() {
                                isTerAndConditionAggress = value!;
                              });
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            tristate: false,
                          ),
                          const Text(
                            " I agree to Privacy Policy of 360 ed",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BouncingWidget(
                      duration: const Duration(milliseconds: 400),
                      scaleFactor: 1.5,
                      onPressed: () async {
                        register(
                            context,
                            userNameController.text.toString(),
                            passwordController.text.toString(),
                            confirmPasswordController.text.toString(),
                            emailController.text.toString(),
                            phoneController.text.toString(),
                            "dob",
                            stateSelected.toString(),
                            categorySelected.toString(),
                            professionalController.text.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/button_green.png",
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 54,
                              fit: BoxFit.fill,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 32, top: 16),
                              child: Text(
                                "Create Account/အကောင့်သစ် ဖွင့်မယ်",
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
                    const SizedBox(
                      height: 8,
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
