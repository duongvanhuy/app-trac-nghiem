import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DetailExam extends StatelessWidget {
  const DetailExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                value.back_delete_allMemory();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            "Bộ đề thi thử ${value.topic.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Nộp bài",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {},
            )
          ],
          centerTitle: true,
        ),
        body: buildBody(value),
        bottomNavigationBar: buildBottomNavigationBar(context, value),
      );
    });
  }

  buildBody(value) {
    return Container(
      child: Column(
        children: [
          buildTime(),
          buildQuestion(value),
          SizedBox(height: 10),
          buildListAnswer(value)
        ],
      ),
    );
  }

  buildTime() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color.fromARGB(137, 50, 31, 226),
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75))
        ],
      ),
      child: Center(
          child: Text(
        "3:21",
        style: TextStyle(fontSize: 18, color: Colors.white),
      )),
    );
  }

  buildQuestion(value) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Câu ${value.questionNow}/${value.topic.items.length}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("${value.question.questionName}")
        ],
      ),
    );
  }

  buildListAnswer(value) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              value.changeAnswerUser("A");
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: Text("A"),
                  backgroundColor: value.colorBasic[0],
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Text("${value.question.answerA}"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              value.changeAnswerUser("B");
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: Text("B"),
                  backgroundColor: value.colorBasic[1],
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Text("${value.question.answerB}"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              value.changeAnswerUser("C");
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: Text("C"),
                  backgroundColor: value.colorBasic[2],
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Text("${value.question.answerC}"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              value.changeAnswerUser("D");
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: Text("D"),
                  backgroundColor: value.colorBasic[3],
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Text("${value.question.answerD}"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // buildAnswer(value) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 10, bottom: 10),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         CircleAvatar(
  //           child: Text("1"),
  //           backgroundColor: Colors.blue,
  //         ),
  //         SizedBox(width: 20),
  //         Flexible(
  //           child: Text("${value.question.answerA}"),
  //         )
  //       ],
  //     ),
  //   );
  // }

  buildBottomNavigationBar(BuildContext context, value) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 224, 221, 221)),
      padding: EdgeInsets.symmetric(horizontal: 35),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: CircleAvatar(
              child: Icon(Icons.arrow_back),
            ),
            onTap: () {
              value.previousQuestion();
            },
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return buildModalBottomWidget(context, value);
                    });
              },
              icon: Icon(Icons.arrow_drop_up)),
          InkWell(
            child: CircleAvatar(
              child: Icon(Icons.arrow_forward),
            ),
            onTap: () {
              value.nextQuestion();
            },
          ),
        ],
      ),
    );
  }

  buildModalBottomWidget(BuildContext context, value) {
    return Container(
      height: 200.0,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0))),
        child: GridView.count(
          crossAxisCount: 10,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children:
              new List<Widget>.generate(value.topic.items.length, (index) {
            return new GridTile(
              child: new CircleAvatar(
                  backgroundColor: value.listNumberQuestion[index],
                  child: new Center(
                    child: new Text("${index + 1}"),
                  )),
            );
          }),
        ),
      ),
    );
  }
}


//  Container(
//                   height: 30,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border(
//                       top: BorderSide(
//                           color: Color.fromARGB(255, 87, 85, 85),
//                           width: 0.3,
//                         ),
//                          bottom: BorderSide(
//                            color: Colors.red,
//                           width: 2,
//                         ),
//                     ),
//                     borderRadius: BorderRadius.circular(10),
                    
//                   ),
//                   child: Center(
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_drop_down,
//                      ),
//                       color: Colors.black,
//                       iconSize: 20,
//                       onPressed: (){
//                         Navigator.pop(context);
//                       },)),
//                 ),