import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/provider/change_setting_exam.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:apptracnghiem/view/exam/exam_results.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:apptracnghiem/view/setting/home_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => APIHelper()),
      ChangeNotifierProvider(create: (context) => ChangeSettingExamProvider()),
    ],
    child: MaterialApp(
      // home: LoginView(),
      home: Home(),

      debugShowCheckedModeBanner: false,
    ),
  ));
}
