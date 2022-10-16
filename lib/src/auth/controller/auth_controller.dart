import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning/data/response/auth_response.dart';
import 'package:learning/src/app.dart';
import 'package:learning/src/main_map/main_map1.dart';
import 'package:learning/src/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _monthList = [
  //in short terms
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

enum ForgetPasswordType { question, email }

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController() : super(const AsyncData(null));

  String _covertMonthToNumber(String month) {
    for (var i in _monthList) {
      if (i == month) {
        return _monthList.indexOf(i).toString().length == 1
            ? '0$_monthList.indexOf(i)'
            : '$_monthList.indexOf(i)';
      }
    }
    return '';
  }

  Future<void> forgetPassword({
    required ForgetPasswordType type,
    String? email,
    String? userName,
    String? year,
    String? month,
    String? date,
  }) async {
    state = const AsyncLoading();
    final body = type == ForgetPasswordType.email
        ? {
            'type': 'email',
            'email': email,
          }
        : {
            'type': 'question',
            'user_name': userName,
            'dob': '$year-${_covertMonthToNumber(month ?? '')}-$date'
          };

    final response = await http.post(
      Uri.parse(
        'https://wwf.360ed.com/api/forget-password',
      ),
      headers: kHeaders,
      body: body,
    );
    if (response.statusCode == 200) {
      state = const AsyncData(null);
    } else {
      state = AsyncError('Server Error', StackTrace.current);
    }
  }

  Future<void> register({
    required String name,
    required String password,
    required String passwordConfirm,
    required String email,
    required String phone,
    required String dob,
    required String state,
    required String userType,
    required String profession,
  }) async {
    this.state = const AsyncLoading();
    final response =
        await http.post(Uri.parse('https://wwf.360ed.com/api/login'),
            headers: kHeaders,
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
              'device_token': 'waswaswaswaswaswaswaswaswwa'
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
    log('${response.statusCode}status code');
    log(response.body);
    if (response.statusCode == 200) {
      this.state = const AsyncData(null);
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
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const MainMapFirstScreen()),
      );
    } else {
      this.state = AsyncError('Error', StackTrace.current);
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>(
  (_) => AuthController(),
);
