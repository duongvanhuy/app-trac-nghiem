import 'dart:convert';
import 'dart:io';

import 'package:apptracnghiem/model/user.dart';
import 'package:apptracnghiem/provider/SettingHelper.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static var user = SettingHelper.user;
  //Login
  static Future<User?> login(String userName, String password) async {
    // var user = SettingHelper.user;

    // Map data = {
    //   "userNameOrEmailAddress": userName,
    //   "password": password,
    //   "rememberClient": true
    // };
    // var body = json.encode(data);
    // print('${SettingHelper.apiURL}/api/TokenAuth/Authenticate');
    // print("body" + body);
    var response = await http.post(
        Uri.parse('https://api.huego.vifiretek.vn/api/TokenAuth/Authenticate'),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(<String, String>{
          "userNameOrEmailAddress": "duonghuy261",
          "password": "!2345Abcd",
          "rememberClient": "true"
        }));

    print(response.statusCode);
    print('${SettingHelper.apiURL}/api/TokenAuth/Authenticate');
    if (response.statusCode == 200) {
      var login = jsonDecode(response.body);

      var success = login['success'];
      if (!success) return null;
      var result = login['result'];
      var accessToken = result['accessToken'];

      var expireInSeconds = result['expireInSeconds'];
      var userEmail = result['email'];
      var fullName = result['fullName'];
      var userMeta = result['userMetas'];
      var userId = result['userId'];
      print('login userMeta$userMeta');
      var lastLogin = DateTime.now().toString();

      return new User(accessToken, expireInSeconds, lastLogin, userId, userName,
          userEmail, fullName, password, userMeta == null ? "" : userMeta);
    } else {
      print('Failed to login');
      return null;
    }
  }
}
