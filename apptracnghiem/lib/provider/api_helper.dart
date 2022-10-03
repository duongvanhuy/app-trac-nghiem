import 'dart:convert';
import 'dart:io';

import 'package:apptracnghiem/model/answer_result.dart';
import 'package:apptracnghiem/model/question.dart';
import 'package:apptracnghiem/model/topic.dart';
import 'package:apptracnghiem/model/user.dart';
import 'package:apptracnghiem/provider/SettingHelper.dart';
import 'package:apptracnghiem/provider/change_setting_exam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIHelper extends ChangeNotifier {
  // static var user = SettingHelper.user;
  User user = User();
  String a = "a";
  List<Topic> listTopic = [];
  Topic topic = Topic();
  Question question = Question();
  String message = "";
  int questionNow = 1;
  // mảng mã màu để lưu lại 2 màu:-- mau 1: lưu cho đáp án không được chọn
  // màu 2: thay đổi cho đáp án được chọn
  List<Color> colorBasic = [
    SettingHelper.colors[2],
    SettingHelper.colors[2],
    SettingHelper.colors[2],
    SettingHelper.colors[2]
  ];

  // cài đặt số lượng câu hỏi trong bài thi -- mặc định 10 câu
  // int totalQuestion = SettingHelper.totolQuestion[0];
  int totalQuestion = ChangeSettingExamProvider().totalQuestion;
  List<Color> listNumberQuestion = [];
  bool isDone = false; // đặt trạng thái bài thi
  AnswerResult answerResult = AnswerResult(); // lưu lại kết quả bài thi

  //Login
  Future<bool> login(String userName, String password) async {
    var response =
        await http.post(Uri.parse('https://localhost:7107/api/Authen/Login'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              'userName': userName,
              'password': password,
            }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      // user.password = password;
      // user.userName = userName;
      Map<String, dynamic> dataUser = json.decode(response.body);
      // convert String into json

      // user = User.fromJson(jsonDecode(dataUser.));
      // convert into Json
      user = User.fromJson(dataUser);
      print("user" + user.toString());
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
      List<Topic> listTopicMemory = [];
      var data = jsonDecode(response.body);
      print("totalQuestion" + totalQuestion.toString());
      for (var item in data) {
        listTopicMemory.add(Topic.fromJson(item));
      }
      print("listTopicMemory" + listTopicMemory.length.toString());
      for (int i = 0; i < listTopicMemory.length; i++) {
        // listTopicMemory[i].items = [];

        // for (int j = 0; j < totalQuestion; j++) {
        //   listTopicMemory[i].items!.add(listTopicMemory[i].items![j]);
        // }
        listTopicMemory[i]
            .items!
            .removeRange(totalQuestion, listTopicMemory[i].items!.length);
      }
      listTopic = listTopicMemory;
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // register
  Future<bool> register(String userName, String password, String email) async {
    var response = await http.post(
        Uri.parse('https://localhost:7107/api/Authen/Register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
          'email': email
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Đăng kí thành công");
      return true;
    } else {
      // throw Exception('Failed to load products');
      message = response.body;
      return false;
    }
  }

  // change password
  Future<bool> changePassword(String newPassword, String oldPassword) async {
    print("oldPassword" +
        oldPassword +
        "newPassword" +
        newPassword +
        "user" +
        user.password!);
    if (oldPassword == user.password) {
      var response = await http.post(
          Uri.parse('https://localhost:7107/api/Authen/ChangePassword'),
          headers: {
            'Content-Type': 'application/json',
            // 'Authorization': 'Bearer ' + user.token,
          },
          body: jsonEncode(<String, String>{
            'username': user.username!,
            'password': newPassword,
          }));
      if (response.statusCode == 200) {
        print("Đổi mật khẩu thành công");
        return true;
      } else {
        // throw Exception('Failed to load products');

        return false;
      }
    } else {
      return false;
    }
  }

// get topic by id
  // void getTopicById(int id) async {
  //   var response = await http.get(
  //       Uri.parse('https://localhost:7107/api/Topic/GetTopicById?id=' +
  //           id.toString()),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         // 'Authorization': 'Bearer ' + user.token,
  //       });
  //   if (response.statusCode == 200) {
  //     Topic topicById = Topic();
  //     var data = jsonDecode(response.body);
  //     topicById = Topic.fromJson(data);
  //     for (int i = 0; i < totalQuestion; i++) {
  //       topic.items!.add(topicById.items![i]);
  //     }
  //     getQuestionInTopic();
  //     notifyListeners();
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }
  void getTopicById(int id) async {
    listTopic.forEach((element) {
      if (element.id == id) {
        topic = element;
      }
    });
    getQuestionInTopic();
    listNumberQuestions();
    notifyListeners();
  }

  void changeQuestionNow(int index) {
    questionNow = index;
    changeColorAnswer();
    notifyListeners();
  }

  void getQuestionInTopic() {
    question = topic.items![questionNow - 1];
  }

  void nextQuestion() {
    if (questionNow <= topic.items!.length - 1) {
      ++questionNow;

      getQuestionInTopic();
      changeColorAnswer();
    }
  }

  void previousQuestion() {
    if (questionNow > 0) {
      --questionNow;

      getQuestionInTopic();
      changeColorAnswer();
    }
  }

  void changeColorAnswer() {
    var colorAnswer = topic.items![questionNow - 1].answerUser;
    if (isDone == false) {
      if (colorAnswer != null) {
        listNumberQuestion[questionNow - 1] = SettingHelper.colors[0];
        switch (colorAnswer) {
          case "A":
            colorBasic[0] = SettingHelper.colors[0];
            colorBasic[1] = SettingHelper.colors[2];
            colorBasic[2] = SettingHelper.colors[2];
            colorBasic[3] = SettingHelper.colors[2];
            break;
          case "B":
            colorBasic[0] = SettingHelper.colors[2];
            colorBasic[1] = SettingHelper.colors[0];
            colorBasic[2] = SettingHelper.colors[2];
            colorBasic[3] = SettingHelper.colors[2];
            break;
          case "C":
            colorBasic[0] = SettingHelper.colors[2];
            colorBasic[1] = SettingHelper.colors[2];
            colorBasic[2] = SettingHelper.colors[0];
            colorBasic[3] = SettingHelper.colors[2];
            break;
          case "D":
            colorBasic[0] = SettingHelper.colors[2];
            colorBasic[1] = SettingHelper.colors[2];
            colorBasic[2] = SettingHelper.colors[2];
            colorBasic[3] = SettingHelper.colors[0];
            break;
          default:
            colorBasic = [
              SettingHelper.colors[2],
              SettingHelper.colors[2],
              SettingHelper.colors[2],
              SettingHelper.colors[2]
            ];
        }
      } else {
        colorBasic = [
          SettingHelper.colors[2],
          SettingHelper.colors[2],
          SettingHelper.colors[2],
          SettingHelper.colors[2]
        ];
      }
    } else {
      // đã hoàn thành bài thi

      // Nếu câu đúng
      if (topic.items![questionNow - 1].isCorrect == true) {
        //  listNumberQuestion[questionNow - 1] = SettingHelper.colors[3];
        if (colorAnswer != null) {
          //  listNumberQuestion[questionNow - 1] = SettingHelper.colors[0];
          switch (colorAnswer) {
            case "A":
              colorBasic[0] = SettingHelper.colors[3];
              colorBasic[1] = SettingHelper.colors[2];
              colorBasic[2] = SettingHelper.colors[2];
              colorBasic[3] = SettingHelper.colors[2];
              break;
            case "B":
              colorBasic[0] = SettingHelper.colors[2];
              colorBasic[1] = SettingHelper.colors[3];
              colorBasic[2] = SettingHelper.colors[2];
              colorBasic[3] = SettingHelper.colors[2];
              break;
            case "C":
              colorBasic[0] = SettingHelper.colors[2];
              colorBasic[1] = SettingHelper.colors[2];
              colorBasic[2] = SettingHelper.colors[3];
              colorBasic[3] = SettingHelper.colors[2];
              break;
            case "D":
              colorBasic[0] = SettingHelper.colors[2];
              colorBasic[1] = SettingHelper.colors[2];
              colorBasic[2] = SettingHelper.colors[2];
              colorBasic[3] = SettingHelper.colors[3];
              break;
            default:
              colorBasic = [
                SettingHelper.colors[2],
                SettingHelper.colors[2],
                SettingHelper.colors[2],
                SettingHelper.colors[2]
              ];
          }
        } else {
          colorBasic = [
            SettingHelper.colors[2],
            SettingHelper.colors[2],
            SettingHelper.colors[2],
            SettingHelper.colors[2]
          ];
        }
        // nếu câu sai
      } else if (topic.items![questionNow - 1].isCorrect == false) {
        //  listNumberQuestion[questionNow - 1] = SettingHelper.colors[1];
        if (colorAnswer != null) {
          //  listNumberQuestion[questionNow - 1] = SettingHelper.colors[0];
          switch (colorAnswer) {
            case "A":
              colorBasic[0] = SettingHelper.colors[1];
              colorBasic[1] = SettingHelper.colors[2];
              colorBasic[2] = SettingHelper.colors[2];
              colorBasic[3] = SettingHelper.colors[2];
              break;
            case "B":
              colorBasic[0] = SettingHelper.colors[2];
              colorBasic[1] = SettingHelper.colors[1];
              colorBasic[2] = SettingHelper.colors[2];
              colorBasic[3] = SettingHelper.colors[2];
              break;
            case "C":
              colorBasic[0] = SettingHelper.colors[2];
              colorBasic[1] = SettingHelper.colors[2];
              colorBasic[2] = SettingHelper.colors[1];
              colorBasic[3] = SettingHelper.colors[2];
              break;
            case "D":
              colorBasic[0] = SettingHelper.colors[2];
              colorBasic[1] = SettingHelper.colors[2];
              colorBasic[2] = SettingHelper.colors[2];
              colorBasic[3] = SettingHelper.colors[1];
              break;
            default:
              colorBasic = [
                SettingHelper.colors[2],
                SettingHelper.colors[2],
                SettingHelper.colors[2],
                SettingHelper.colors[2]
              ];
          }
          ;
          switch (topic.items![questionNow - 1].answerCorrect) {
            case "A":
              colorBasic[0] = SettingHelper.colors[3];

              break;
            case "B":
              colorBasic[1] = SettingHelper.colors[3];

              break;
            case "C":
              colorBasic[2] = SettingHelper.colors[3];

              break;
            case "D":
              colorBasic[3] = SettingHelper.colors[3];
              break;
            default:
              colorBasic = [
                SettingHelper.colors[2],
                SettingHelper.colors[2],
                SettingHelper.colors[2],
                SettingHelper.colors[2]
              ];
          }
        } else {
          colorBasic = [
            SettingHelper.colors[2],
            SettingHelper.colors[2],
            SettingHelper.colors[2],
            SettingHelper.colors[2]
          ];
        }
      } else {
        // nếu câu chưa làm
        switch (topic.items![questionNow - 1].answerCorrect) {
          case "A":
            colorBasic[0] = SettingHelper.colors[3];
            colorBasic[1] = SettingHelper.colors[2];
            colorBasic[2] = SettingHelper.colors[2];
            colorBasic[3] = SettingHelper.colors[2];
            break;
          case "B":
            colorBasic[0] = SettingHelper.colors[2];
            colorBasic[1] = SettingHelper.colors[3];
            colorBasic[2] = SettingHelper.colors[2];
            colorBasic[3] = SettingHelper.colors[2];
            break;
          case "C":
            colorBasic[0] = SettingHelper.colors[2];
            colorBasic[1] = SettingHelper.colors[2];
            colorBasic[2] = SettingHelper.colors[3];
            colorBasic[3] = SettingHelper.colors[2];
            break;
          case "D":
            colorBasic[0] = SettingHelper.colors[2];
            colorBasic[1] = SettingHelper.colors[2];
            colorBasic[2] = SettingHelper.colors[2];
            colorBasic[3] = SettingHelper.colors[3];
            break;
          default:
            colorBasic = [
              SettingHelper.colors[2],
              SettingHelper.colors[2],
              SettingHelper.colors[2],
              SettingHelper.colors[2]
            ];
        }
      }
    }
    notifyListeners();
  }

  void changeAnswerUser(String index) {
    topic.items![questionNow - 1].answerUser = index;
    //  kiểm tra câu trả lời đúng hay sai
    print(topic.items![questionNow - 1].answerUser);
    print(topic.items![questionNow - 1].answerCorrect);
    if (topic.items![questionNow - 1].answerUser ==
        topic.items![questionNow - 1].answerCorrect) {
      topic.items![questionNow - 1].isCorrect = true;
    } else {
      topic.items![questionNow - 1].isCorrect = false;
    }
    // for (int i = 0; i < topic.items!.length; i++) {
    //   if (topic.items![i].answerUser == topic.items![i].answerCorrect) {
    //     topic.items![i].isCorrect = true;
    //   } else {
    //     topic.items![i].isCorrect = false;
    //   }
    // }
    changeColorAnswer();
    notifyListeners();
  }

  void back_delete_allMemory() {
    topic = Topic();
    question = Question();
    questionNow = 1;
    colorBasic = [
      SettingHelper.colors[2],
      SettingHelper.colors[2],
      SettingHelper.colors[2],
      SettingHelper.colors[2]
    ];
    notifyListeners();
  }

  void backToHome() {
    listTopic = [];
    notifyListeners();
  }

  void listNumberQuestions() {
    for (int i = 0; i < totalQuestion; i++) {
      listNumberQuestion.add(SettingHelper.colors[2]);
    }
    notifyListeners();
  }

// kiểm tra xem tất cả câu hỏi đã trả lời chưa
  bool checkAllAnswerUserIsTrue() {
    bool check = true;
    for (int i = 0; i < topic.items!.length; i++) {
      if (topic.items![i].answerUser == null) {
        check = false;
        break;
      }
    }
    return check;
  }

  // set status isDone
  void setIsDone(bool isDone) {
    this.isDone = isDone;
    notifyListeners();
  }

  // kết quả bài thi
  void result() {
    setIsDone(true);
    //    int? totalCount;
    // int? rightCount;
    // int? wrongCount;
    // int? undoneCount;
    // int? idUser;
    //int? idTopic;

    int rightCount = 0;
    int wrongCount = 0;
    topic.items!.forEach((element) {
      if (element.isCorrect == true) {
        rightCount++;
      } else if (element.isCorrect == false) {
        wrongCount++;
      }
    });

    answerResult.rightCount = rightCount;
    answerResult.wrongCount = wrongCount;
    answerResult.totalCount = topic.items!.length;
    answerResult.undoneCount = topic.items!.length - rightCount - wrongCount;
    answerResult.idUser = 1;
    answerResult.idTopic = topic.id;

    notifyListeners();
  }
}
