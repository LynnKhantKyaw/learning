import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learning/src/util/constants.dart';

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
    } else {}
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>(
  (_) => AuthController(),
);
