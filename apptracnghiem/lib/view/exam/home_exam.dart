import 'package:apptracnghiem/view/thithu/Detail_Thithu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeExam extends StatelessWidget {
  const HomeExam({Key? key}) : super(key: key);

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
        title: Text("Thi Thử"),
      ),
      body: buildBody(size),
    );
  }

  buildBody(var size) {
    return Container(
      decoration: BoxDecoration(color: Colors.pink),
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ListView(
        children: [buildListItem(size)],
      ),
    );
  }

  buildListItem(var size) {
    return Container(
      height: size.height * .9,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildItem(size, context);
        },
      ),
    );
  }

  buildItem(var size, BuildContext context) {
    return InkWell(
      onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Detail_Thithu()));
                },
      child: Container(
      padding: EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
      margin: EdgeInsets.only(top: 10, bottom: 10, ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 40, 43, 201)),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.abc),
          ),
          SizedBox(width: 15),
          Expanded(
            child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
              
                const Text(
                  "Đề 1",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
               
              
              const Text(
                "Làm bài",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
               Row(
                children: [
                  Expanded(child: Container(height: 10,
                 
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),)
              ),
              Padding(padding: EdgeInsets.all(15),
              child:  Align(
                alignment: Alignment.centerRight,
                child: Text("30 câu", style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18
                )),
              ),)
                ],
              )
            ]),
          )
        ],
      ),
    ),
    );
  }
}
