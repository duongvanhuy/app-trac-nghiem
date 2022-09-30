import 'package:apptracnghiem/provider/demo.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:apptracnghiem/view/setting/home_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Demo_Provider()),
    ],
    child: MaterialApp(
      // home: LoginView(),
      home: HomeSetting(),

      debugShowCheckedModeBanner: false,
    ),
  ));
}
