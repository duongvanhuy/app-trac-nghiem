import 'package:apptracnghiem/provider/demo.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:apptracnghiem/view/ontap/home_ontap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Demo_Provider()),
    ],
    child: MaterialApp(
      // home: LoginView(),
      home: Home(),

      debugShowCheckedModeBanner: false,
    ),
  ));
}
