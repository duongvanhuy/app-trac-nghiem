import 'package:apptracnghiem/view/review/detail_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeSetting extends StatelessWidget {
  const HomeSetting({Key? key}) : super(key: key);

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
        title: Text("Thiết Lập"),
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
      height: size.height * .80,
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 4.4),
        itemBuilder: (BuildContext context, int index) {
          return buildItem(size, context);
        },
      ),
    );
  }

  buildItem(var size, BuildContext context) {
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
                  "Lái Phương Tiện",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailReview()));
                },
              ),
              const Text(
                "60 câu",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const Divider(
                color: Colors.yellow,
                height: 20,
                thickness: 3,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
