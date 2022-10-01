import 'package:apptracnghiem/provider/change_setting_exam.dart';
import 'package:apptracnghiem/view/review/detail_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeSetting extends StatelessWidget {
  HomeSetting({Key? key}) : super(key: key);
  var listSetting = [
    [Icons.list_alt_outlined, "Số lượng câu", <int>[10,20,30,40], " câu", Colors.red],
    [Icons.timer_sharp, "Thời gian thi", <int>[3,5,7,9], " phút", Colors.green],
  ];
  var changeSettingExamProvider;
  var size ;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    changeSettingExamProvider = Provider.of<ChangeSettingExamProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Thiết Lập"),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/about_blue_background.png"),
          fit: BoxFit.cover
        )
      ),
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: ListView(
        children: [buildListItem(context)],
      ),
    );
  }

  buildListItem(BuildContext context) {
    return Container(
      height: size.height * .80,
      child: GridView.builder(
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 4.4),
        itemBuilder: (BuildContext context, int index) {
          return buildItemTime(listSetting[index], context);
        },
      ),
    );
  }

  buildItemTime(var itemSetting, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 2), // changes position of shadow
            ),
          ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 40, 43, 201)),
            ),  
            padding: EdgeInsets.all(10),
            child: Icon(itemSetting[0], color: itemSetting[4], size: 32,),
          ),
          SizedBox(width: 15),
          Expanded(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    itemSetting[1] , //Tiêu đề
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 3,
                    color: itemSetting[4],
                  ),
            ]),
          ),
          SizedBox(width: 5),
          DropdownButton<String>(
            value: (itemSetting[3] == " phút" ? changeSettingExamProvider.time.toString() : changeSettingExamProvider.totalQuestion.toString()) + itemSetting[3], //Đơn vị
            items: itemSetting[2].map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value.toString() + itemSetting[3], //Đơn vị
                child: Text(value.toString() + itemSetting[3]), //Đơn vị
              );
            }).toList(),
            onChanged: (value) {
              changeSettingExamProvider.changeSettingExam(value);
              
              // print(value);
            },
          )
        ],
      ),
    );
  }

  // Chọn số câu hỏi
  buildItemTotalQuestion(var size, BuildContext context, ChangeSettingExamProvider changeSettingExamProvider) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 2), // changes position of shadow
            ),
          ],
      ),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                child: Text(
                  "Số lượng câu",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailReview()));
                },
              ),
              const Divider(
                color: Colors.yellow,
                height: 20,
                thickness: 3,
              ),
            ]),
          ),
          DropdownButton<String>(
            value: changeSettingExamProvider.time.toString() + " câu",
            items: <int>[15, 20, 25, 30].map((int value) {
              return DropdownMenuItem<String>(
                value: value.toString() + " câu",
                child: Text(value.toString() + " câu"),
              );
            }).toList(),
            onChanged: (value) {
              // changeSettingExamProvider.changeTimeExam(value);
              print(value);
            },
          )
        ],
      ),
    );
  }
}
