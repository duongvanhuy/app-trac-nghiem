import 'package:apptracnghiem/view/account/loginView.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tài khoản"),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(context) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        children: [
          buildHeader(),
          SizedBox(
            height: 20,
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildHeader() {
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
          buildName(),
          SizedBox(
            height: 10,
          ),
          buildEmail(),
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

  Widget buildName() {
    return Container(
      child: Text(
        "Nguyễn Văn A",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Container(
      child: Text(
        "nguyenvana12@gmail.com",
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

  Widget buildContent(context) {
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
                    Text("nguyenvana12@gmail.com",
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
}
