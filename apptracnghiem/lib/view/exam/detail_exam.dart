import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/exam/exam_results.dart';
import 'package:apptracnghiem/view/exam/home_exam.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DetailExam extends StatelessWidget {
  DetailExam({Key? key}) : super(key: key);
  var countDownTimer = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: value.isDone
              ? (IconButton(
                  onPressed: () {
                    value.backToHome();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(Icons.home)))
              : Text(""),
          title: Text(
            "Bộ đề thi thử ${value.topic.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // actions: !value.isDone
          //     ? buildButtonNopBai(value, context)
          //     : Text(""), //Xử lý nếu trạng thí false thì hiển thị nút nộp bài
          actions: <Widget>[
            !value.isDone ? buildButtonNopBai(value, context) : Text("")
          ],

          centerTitle: true,
        ),
        body: buildBody(value, context),
        bottomNavigationBar: buildBottomNavigationBar(context, value),
      );
    });
  }

  buildButtonNopBai(value, context) {
    return Container(
      child: TextButton(
          child: Text(
            "Nộp bài",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            var check = value.checkAllAnswerUserIsTrue();
            // check == true => đã đã trả lời hết
            print("check" + check.toString());

            if (check == false) {
              // show confirm dialog "Bạn chưa hoàn thành hết bài thi, bạn có muốn nộp bài không ?"
              showMessage(context, value);
            } else {
              value.result(countDownTimer.getTime());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExamResults()));
            }
          }),
    );
  }

  buildBody(value, context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTime(value, context),
          buildQuestion(value),
          SizedBox(height: 10),
          buildListAnswer(value)
        ],
      ),
    );
  }

  buildTime(value, context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      alignment: Alignment.center,
      child: buildTimeCountDown(value, context),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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

  showMessage(context, value) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Chú ý!!!"),
            content: Text(
                "Bạn chưa hoàn thành hết bài thi, bạn có muốn nộp bài không ?"),
            actions: [
              TextButton(
                child: Text("Quay lại"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("Nộp bài"),
                onPressed: () {
                  value.result(countDownTimer.getTime());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExamResults()));
                },
              ),
            ],
          );
        });
  }

  buildTimeCountDown(value, context) {
    return CircularCountDownTimer(
      duration: value.time * 60, //Tổng số thời gian chạy
      initialDuration: 0, //Bắt đầu từ bao nhiêu
      controller: countDownTimer,
      width: 80,
      height: 80,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: Colors.purpleAccent[100]!,
      fillGradient: null,
      backgroundColor: Colors.purple[500],
      backgroundGradient: null,
      strokeWidth: 20.0, //Kích thước của con trỏ chạy
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.MM_SS, //Format kiểu hiển thị thời gian
      isReverse: true, //Đếm ngược
      isReverseAnimation: false,
      isTimerTextShown: true, //Hiển thị thời gian
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
        value.result();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExamResults()));
      },
    );
  }
}
