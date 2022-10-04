import 'package:apptracnghiem/provider/api_helper.dart';
import 'package:apptracnghiem/view/exam/detail_exam.dart';
import 'package:apptracnghiem/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<APIHelper>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            }, 
            icon: Icon(Icons.home)
          )
        ),
        body: buidBody(value, context),
      );
    });
  }

  Widget buidBody(value, context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/ontap_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          // "kết quả"
          Container(
              //FULL WIDTH
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text('KẾT QUẢ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 10,
          ),
          // profile
          profile(),
          result(value, context),
        ],
      ),
    );
  }

  Widget profile() {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
      ),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Họ và tên: Nguyễn Văn A",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Hạng thi: Hạng nhất",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Chứng chỉ: Lái Phương Tiện",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }

  Widget result(value, context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        Container(
          child: Center(
            child: Text("Bộ môn Java",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(Icons.check_circle,
                        size: 40, color: Colors.green)),
                title: Text("Đúng: ${value.answerResult.rightCount} câu",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 75, bottom: 5),
              //   child:  LinearProgressIndicator(
              //     width: 220.0,
              //     lineHeight: 4.0,
              //     percent: 1,
              //     progressColor: Colors.green,
              //   ),
              // )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(Icons.remove_circle_outlined,
                        size: 40, color: Colors.red)),
                title: Text("Sai: ${value.answerResult.wrongCount} câu",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 75, bottom: 5),
              //   child: new LinearPercentIndicator(
              //     width: 220.0,
              //     lineHeight: 4.0,
              //     percent: 1,
              //     progressColor: Colors.red,
              //   ),
              // )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child:
                        Icon(Icons.check_circle, size: 40, color: Colors.grey)),
                title: Text("Còn lại: ${value.answerResult.undoneCount} câu",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 75, bottom: 5),
              //   child: new LinearPercentIndicator(
              //     width: 220.0,
              //     lineHeight: 4.0,
              //     percent: 1,
              //     progressColor: Colors.grey,
              //   ),
              // )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: TextButton(
                onPressed: () {
                  value.changeColorAnswer();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailExam()));
                  print("Xem kết quả thi");
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  // background color
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    "Xem kết quả thi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )))
      ]),
    );
  }
}
