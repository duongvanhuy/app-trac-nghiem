import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:apptracnghiem/view/setting/home_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => APIHelper()),
    ],
    child: MaterialApp(
      //home: LoginView(),
      home: Home(),

      debugShowCheckedModeBanner: false,
    ),
  ));
}
