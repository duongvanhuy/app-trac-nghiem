import 'package:apptracnghiem/provider/demo.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:apptracnghiem/view/ontap/home_ontap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: 
      [
         ChangeNotifierProvider(create: (context) => Demo_Provider()),
      ],
      child: MaterialApp(
        home: Home_OnTap(),
        debugShowCheckedModeBanner: false,
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo 123',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
