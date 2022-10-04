import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/about_us/home_about_us.dart';
import 'package:apptracnghiem/view/exam/home_exam.dart';
import 'package:apptracnghiem/view/regulation/home_regulation.dart';
import 'package:apptracnghiem/view/review/home_review.dart';
import 'package:apptracnghiem/view/profile/profile.dart';
import 'package:apptracnghiem/view/setting/home_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        // ),
        body: buildBody(context, value),
      );
    });
  }

  Widget buildBody(context, value) {
    return Column(
      children: [
        buildHeader(context),
        buildContent(context, value),
      ],
    );
  }

  Widget buildHeader(
    context,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25 - 27,
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 54,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(255, 48, 96, 201),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 48, 96, 201),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                'images/logo-gub-home-removebg-preview.png',
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(context, value) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.96, // set height
        ),
        // primary: false,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () {
                value.getAllTopic();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeReview()));
              },
              child: Container(
                //  padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                // border bottom
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 230, 219, 11),
                      width: 4,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.auto_stories_sharp,
                      color: Color.fromARGB(255, 230, 219, 11),
                      size: 65,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ôn tập lý thuyết',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
              child: InkWell(
            onTap: () {
              value.getAllTopic();

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeExam()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              // border bottom
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 232, 47, 47),
                    width: 4,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.ballot_rounded,
                    color: Color.fromARGB(255, 232, 47, 47),
                    size: 65,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thi thử',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeSetting()));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                // border bottom
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 4,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.blue,
                      size: 65,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cài đặt',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
              child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeRegulation()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              // border bottom
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.green.shade400,
                    width: 4,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.green.shade400,
                    size: 65,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Quy chế',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )),
          Card(
              child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeAboutUs()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              // border bottom
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 35, 197, 43),
                    width: 4,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    // icon ""about us""
                    Icons.camera_front,

                    color: Color.fromARGB(255, 35, 197, 43),
                    size: 65,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Về chúng tôi',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                // border bottom
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 247, 39, 60),
                      width: 4,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      // icon ""about us""
                      Icons.lock,

                      color: Color.fromARGB(255, 247, 39, 60),
                      size: 65,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tài khoản',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
