import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/exam/detail_exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeExam extends StatelessWidget {
  const HomeExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                value.backToHome();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text("Thi Thử"),
        ),
        body: buildBody(size, value),
      );
    });
  }

  buildBody(var size, value) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/bg-it2.jpg"),
        fit: BoxFit.cover,
      )),
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ListView(
        children: [buildListItem(size, value)],
      ),
    );
  }

  buildListItem(var size, value) {
    // print("lengthaaaaa" + value.listTopic.length.toString());
    return Container(
      height: size.height * .9,
      child: ListView.builder(
        itemCount: value.listTopic.length,
        itemBuilder: (BuildContext context, int index) {
          print("index" + index.toString());
          return buildItem(size, context, value, index);
        },
      ),
    );
  }

  buildItem(var size, BuildContext context, value, index) {
    return InkWell(
      onTap: () {
        value.isDone = false;
        value.getTopicById(value.listTopic[index].id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailExam()));
      },
      child: Container(
        padding: EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
        margin: EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bộ đề thi thử ${value.listTopic[index].name}",
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
                        Expanded(
                            child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                "${value.listTopic[index].items.length} câu",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 18)),
                          ),
                        )
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
