import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/exam/exam_results.dart';
import 'package:apptracnghiem/view/exam/home_exam.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DetailReview extends StatelessWidget {
  DetailReview({Key? key}) : super(key: key);
  var countDownTimer = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                value.backToHome();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.home)),
          title: Text(
            "Bộ đề thi thử ${value.topic.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: buildBody(value, context),
        bottomNavigationBar: buildBottomNavigationBar(context, value),
      );
    });
  }

  buildBody(value, context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildQuestion(value),
          SizedBox(height: 10),
          buildListAnswer(value)
        ],
      ),
    );
  }

  buildQuestion(value) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Câu ${value.questionNow}/${value.topic.items.length}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.star, color: Colors.black))),
            ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
          SizedBox(
            height: 10,
          ),
          Row(
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
          SizedBox(
            height: 10,
          ),
          Row(
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
          SizedBox(
            height: 10,
          ),
          Row(
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
        ],
      ),
    );
  }

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
              value.previousQuestionInReview();
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
              value.nextQuestionInReview();
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
          children: List<Widget>.generate(value.topic.items.length, (index) {
            return GridTile(
              child: InkWell(
                onTap: () {
                  value.changeQuestionNow(++index);
                  Navigator.pop(context);
                  print("index: $index");
                },
                child: CircleAvatar(
                    backgroundColor: value.listNumberQuestion[index],
                    child: Center(
                      child: Text("${index + 1}"),
                    )),
              ),
            );
          }),
        ),
      ),
    );
  }
}
