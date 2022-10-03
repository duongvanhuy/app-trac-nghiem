import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  var currentPasswordController = TextEditingController();
  var newPassWordController = TextEditingController();
  var confirmPassWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    //Hiển thị toast message
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        endDrawer: buildEndDrawer(context, value),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Tài khoản"),
          // actions: [
          //   InkWell(
          //     onTap: () {
          //       Drawer(
          //         backgroundColor: Colors.white,
          //       );
          //     },
          //     child: Container(
          //       padding: EdgeInsets.only(right: 10),
          //       child: Icon(Icons.settings),
          //     ),
          //   )
          // ],
        ),
        body: buildBody(context, value),
      );
    });
  }

  Widget buildBody(context, value) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        children: [
          buildHeader(value),
          SizedBox(
            height: 20,
          ),
          buildContent(context, value),
        ],
      ),
    );
  }

  Widget buildHeader(value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        //  color: Color.fromARGB(255, 92, 113, 219),
        image: DecorationImage(
          image: AssetImage('images/bg-login.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        children: [
          buildAvatar(),
          SizedBox(
            height: 15,
          ),
          buildName(value),
          SizedBox(
            height: 10,
          ),
          buildEmail(value),
          SizedBox(
            height: 20,
          ),
          following(),
        ],
      ),
    );
  }

  Widget buildAvatar() {
    return Container(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
            "https://media.istockphoto.com/photos/businessman-silhouette-as-avatar-or-default-profile-picture-picture-id476085198?b=1&k=20&m=476085198&s=612x612&w=0&h=Ov2YWXw93vRJNKFtkoFjnVzjy_22VcLLXZIcAO25As4="),
      ),
    );
  }

  Widget buildName(value) {
    return Container(
      child: Text(
        value.user.username,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildEmail(value) {
    return Container(
      child: Text(
        value.user.email,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget following() {
    return Container(
      alignment: Alignment.center,
      child: Row(children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1000".padRight(5),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              Text(
                "Follower",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "10".padRight(5),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            Text(
              "Đang Follower",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
          ],
        )),
      ]),
    );
  }

  Widget buildContent(context, value) {
    return Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.email,
                  size: 35,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(value.user.email,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // number phone
            Row(
              children: [
                Icon(
                  Icons.phone_android_sharp,
                  size: 35,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Số điện thoại",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("030203023",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_business_rounded,
                  size: 35,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Địa chỉ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("Tỉnh Thừa Thiên Huế",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.facebook,
                  size: 35,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("https://www.facebook.com/nguyenvana12",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // đăng xuất
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Text("Đăng xuất",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  buildEndDrawer(context, value) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(value.user.username),
            accountEmail: Text(value.user.email),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                "https://media.istockphoto.com/photos/businessman-silhouette-as-avatar-or-default-profile-picture-picture-id476085198?b=1&k=20&m=476085198&s=612x612&w=0&h=Ov2YWXw93vRJNKFtkoFjnVzjy_22VcLLXZIcAO25As4=",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            )),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg-login.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text("Thông báo"),
            trailing: CircleAvatar(
              maxRadius: 10,
              child: Text(
                "5",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Giới thiệu"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add_alt),
            title: Text("Bạn bè(5)"),
            trailing: Text("Kết bạn"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.save),
            title: Text("Câu hỏi đã lưu"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.stacked_bar_chart),
            title: Text("Thống kê"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Góp ý"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.change_circle_outlined),
            title: Text("Đổi mật khẩu"),
            onTap: () {
              showDialogChangePassword(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            title: Text("Về chúng tôi"),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }

  showDialogChangePassword(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Đổi mật khẩu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            content: Container(
              height: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: currentPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Mật khẩu hiện tại",
                        hintText: "Nhập mật khẩu hiệN tại",
                        // Cho icon nằm cuối
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vui lòng nhập mật khẩU";
                        }
                        if (value.length < 8) {
                          return "Mật khẩu tối thiếu 8 kí tự";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: newPassWordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Mật khẩu mới",
                        hintText: "Mật khẩu mới",
                        // Cho icon nằm cuối
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vui lòng nhập mật khẩu";
                        }
                        if (value.length < 8) {
                          return "Mật khẩu tối thiếu 8 kí tự";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPassWordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Nhập lại mật khẩu",
                        hintText: "Nhập lại mật khẩu",
                        // Cho icon nằm cuối
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vui lòng nhập mật khẩu";
                        }
                        if (value != newPassWordController.text) {
                          return "Nhập lại mật khẩu không đúng";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigator.of(context).pop();
                            // return Toast.show(
                            //   "Đổi mật khẩu thành công",
                            //   duration: Toast.lengthShort,
                            //   gravity:  Toast.top);
                          }
                        },
                        child: Text("Đổi mật khẩu"))
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Thoát'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
