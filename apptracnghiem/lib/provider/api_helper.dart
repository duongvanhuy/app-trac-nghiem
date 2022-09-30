import 'dart:convert';
import 'dart:io';

import 'package:apptracnghiem/model/user.dart';
import 'package:apptracnghiem/provider/SettingHelper.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static var user = SettingHelper.user;
  //Login
  static Future<bool> login(String userName, String password) async {
    var response = await http.post(
        Uri.parse('https://localhost:7107/api/Authen/Login/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userName': userName,
          'password': password,
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      // throw Exception('Failed to load products');
      return false;
    }
  }
}
