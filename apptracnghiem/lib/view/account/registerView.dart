// import material
import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:flutter/material.dart';

import 'package:apptracnghiem/configs/setting.dart';
import 'package:apptracnghiem/widget/widget_input.dart';
import 'package:apptracnghiem/widget/account/icon_bottom.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class RegisterView extends StatefulWidget {
  // contractor
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // xác định duy nhất form này dc validate
  final _formKey = GlobalKey<FormState>();
  // controller for text field
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  // build
  @override
  Widget build(BuildContext context) {
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
          body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                // image: AssetImage('assets/images/bg.jpg'),
                image: AssetImage('images/bg-login.jpg'),
                fit: BoxFit.cover)),
        child: buildBody(value),
      ));
    });
  }

  Widget buildBody(value) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          contentRegister(value),
          // padding
          SizedBox(height: 20),
          IconBottom(),
          SizedBox(height: 20),
          login(),
        ],
      ),
    );
  }

  Widget login() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text("Bạn đã có tài khoản?"),
              ],
            ),
            Column(
              children: [
                goToLogin(),
              ],
            ),
          ]),
    );
  }

  Widget goToLogin() {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        },
        child: Text("Đăng nhập",
            style: TextStyle(fontSize: 16, color: Colors.greenAccent)));
  }

  Widget contentRegister(value) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Đăng kí tài khoản',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 20),
          WidgetInput(_userNameController, Setting.inpName, Icons.person, null,
              "Huy", null),
          // padding bottom
          const SizedBox(height: 20),
          WidgetInput(_emailController, Setting.inpEmail, Icons.email, null,
              'duongvanhuyaaaa@gmail.com', null),
          // padding bottom
          const SizedBox(height: 20),
          WidgetInput(_passwordController, Setting.inpPassword,
              Icons.lock_outline, true, "!2345Abcd", null),
          // padding bottom
          const SizedBox(height: 20),
          WidgetInput(
              _rePasswordController,
              Setting.inpConfirmPassword,
              Icons.lock_outline,
              true,
              _rePasswordController.text,
              "!2345Abcd"),
          // button register
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Đăng kí thành công')),
                // );

                var check = await value.register(_userNameController.text,
                    _passwordController.text, _emailController.text);

                //  print("check" + check.value.toString());
                if (check == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                } else {
                  // Nếu sai thì hiển thị thông báo lỗi
                  return Toast.show(
                    value.message, 
                    duration: Toast.lengthShort, 
                    gravity:  Toast.top
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              //   primary: Colors.black,
              minimumSize: const Size(310, 55),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Đăng kí'),
          ),
        ],
      ),
    );
  }
}
