import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailExam extends StatelessWidget {
  const DetailExam({Key? key}) : super(key: key);

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
          "Đề thi 1",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
       actions: <Widget>[
         TextButton(
             child: Text(
              "Nộp bài",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18),
              ),
             onPressed: () {},
       )
       ],
       centerTitle: true,
       

      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  buildBody() {
    return Container(
      child: Column(
        children: [
          buildTime(),
          buildQuestion(),
          SizedBox(height: 10),
          buildListAnswer()
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
                offset: Offset(0.0, 0.75)
            )
          ],
       
      ),
      child: Center(
        child: Text(
          "3:21",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white),)),
    );
  }
  buildQuestion() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Câu 1/30",
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

  buildBottomNavigationBar(BuildContext context) {
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
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (builder){
                    return buildModalBottomWidget(context);
                      }
                );
            }, 
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
   
   buildModalBottomWidget(BuildContext context) {
      return Container(
          height: 200.0,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          color: Colors.transparent, 
          child:  Container(
              padding: EdgeInsets.only(top: 20),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child:   GridView.count(
                      crossAxisCount: 10,
                        childAspectRatio: 1.0,
                        padding: const EdgeInsets.all(4.0),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0, 
                      children: new List<Widget>.generate(30, (index) {
                        return new GridTile(
                          child: new CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: new Center(
                              child: new Text("${index+1}"),
                            )
                          ),
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