import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailReview extends StatelessWidget {
  const DetailReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back)
        ),
        title: Text(
          "Ôn Tập Luật Giao thông đường bộ",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  buildBody() {
    return Container(
      child: Column(
        children: [
          buildQuestion(),
          SizedBox(height: 10),
          buildListAnswer()
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/iwe_white_background.png"),
          fit: BoxFit.cover
        )
      ),

    );
  }

  buildQuestion() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Câu 1/60",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Text("Thuyền trưởng, người lái phương tiện khi điều khiển phương tiện hoạt động trên đường thuỷ nội địa phải tuân theo quy định:")
        ],
      ),
    );
  }

  buildListAnswer() {
    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return buildAnswer();
        }
      ),
    );
  }

  buildAnswer() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            child: Text("1"),
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 20),
          Flexible(
            child: Text(
              "Quy tắc giao thông vào báo hiệu đường thuỷ nội địa"
            ),
          )
        ],
      ),
    );
  }

  buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 221, 221)
      ),
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

            },
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.arrow_drop_up)
          ),
          InkWell(
            child: CircleAvatar(
              child: Icon(Icons.arrow_forward),
            ),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}