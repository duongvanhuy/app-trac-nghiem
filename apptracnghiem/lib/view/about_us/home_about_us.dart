import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomeAboutUs extends StatelessWidget {
  const HomeAboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Về chúng tôi"),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/about_red_background.png"),
                fit: BoxFit.cover)),
        padding: EdgeInsets.only(top: 10, left: 30, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, right: 20),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "images/logo-gub-home-removebg-preview.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.other_houses_sharp,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "apptracnghiem.java",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "apptracnghiem.gmail.com",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.web_outlined,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "apptracnghiem.com",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "176 Tran Phu, Hue City, VN",
                  style: TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
