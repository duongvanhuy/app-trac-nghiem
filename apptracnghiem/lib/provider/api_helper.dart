import 'dart:convert';
import 'dart:io';

import 'package:apptracnghiem/model/topic.dart';
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

  // get all topic
  static Future<List<Topic>> getAllTopic() async {
    var response = await http.get(
        Uri.parse('https://localhost:7107/api/Topic/GetAllQuestions'),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ' + user.token,
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Topic> topics = [];
      for (var item in data) {
        topics.add(Topic.fromJson(item));
      }
      print("get all topic success" + topics.length.toString());
      return topics;
    } else {
      // throw Exception('Failed to load products');
      return [];
    }
  }
}
