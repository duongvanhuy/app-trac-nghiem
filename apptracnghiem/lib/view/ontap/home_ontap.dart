import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Home_OnTap extends StatelessWidget {
  const Home_OnTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.arrow_back)
        ),
        title: Text("Ôn Tập"),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink
      ),
      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
      child: ListView(
        children: [
          buildItem()
        ],
      ),
    );
  }

  buildItem() {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 40, 43, 201)),
            ),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.abc),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Luật Giao thông đường thuỷ nội địa",
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
              Text(
                "60 câu",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}