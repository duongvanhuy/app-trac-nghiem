import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeRegulation extends StatelessWidget {
  const HomeRegulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Quy chế"),
      ),
      body: buildBody(size),
    );
  }
}

buildBody(Size size) {
  return Container(
      height: size.height,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg-regulation.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1)),
                child: Icon(
                  Icons.cabin_sharp,
                  color: Colors.yellow,
                ),
              ),
              // SizedBox(width: 10),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lái phương tiện",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "191 Câu lý thuyết & thực hành",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      Divider(
                        color: Colors.yellow,
                        height: 20,
                        thickness: 3,
                      ),
                    ]),
              )),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1)),
                child: Icon(
                  Icons.cabin_sharp,
                  color: Colors.red,
                ),
              ),
              // SizedBox(width: 10),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cấu trúc đề",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "- Luật 15 câu",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "- Luồng 6 câu",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "- Vận tải hàng hóa và hành khách 6 câu",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "- Thủy nghiệp cơ bản 3 câu",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      Divider(
                        color: Colors.red,
                        height: 20,
                        thickness: 3,
                      ),
                    ]),
              )),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1)),
                child: Icon(
                  Icons.cabin_sharp,
                  color: Color.fromARGB(255, 15, 98, 167),
                ),
              ),
              // SizedBox(width: 10),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thời gian thi",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Tối đa 2phút/câu. Có 30 câu hỏi làm đúng từ 25 câu trở lên là đạt",
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 155, 240),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                      ),
                      Divider(
                        color: Color.fromARGB(255, 15, 98, 167),
                        height: 20,
                        thickness: 3,
                      ),
                    ]),
              )),
            ],
          )),
        ],
      ));
}
