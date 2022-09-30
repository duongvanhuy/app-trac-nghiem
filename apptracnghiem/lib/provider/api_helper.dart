import 'dart:convert';
import 'dart:io';

import 'package:apptracnghiem/model/question.dart';
import 'package:apptracnghiem/model/topic.dart';
import 'package:apptracnghiem/model/user.dart';
import 'package:apptracnghiem/provider/SettingHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class APIHelper extends ChangeNotifier {
  static var user = SettingHelper.user;
  String a = "a";
  List<Topic> listTopic = [];
  Topic topic = Topic();
  Question question = Question();
  int questionNow = 1;
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
  void getAllTopic() async {
    var response = await http.get(
        Uri.parse('https://localhost:7107/api/Topic/GetAllQuestions'),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ' + user.token,
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      for (var item in data) {
        listTopic.add(Topic.fromJson(item));
      }
      print("get all topic success" + listTopic.length.toString());
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

// get topic by id
  void getTopicById(int id) async {
    var response = await http.get(
        Uri.parse('https://localhost:7107/api/Topic/GetTopicById?id=' +
            id.toString()),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ' + user.token,
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      topic = Topic.fromJson(data);
      print("get topic by id success" + listTopic.length.toString());
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void changeQuestionNow(int index) {
    questionNow = index;
    notifyListeners();
  }

  void getQuestionInTopic() {
    question = topic.items![questionNow - 1];
    notifyListeners();
  }

  void nextQuestion() {
    if (questionNow <= topic.items!.length - 1) {
      questionNow++;
      getQuestionInTopic();
    }
  }

  void previousQuestion() {
    if (questionNow > 0) {
      questionNow--;
      getQuestionInTopic();
    }
  }
}
