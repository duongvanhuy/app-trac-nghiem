import 'package:flutter/cupertino.dart';

class ChangeSettingExamProvider extends ChangeNotifier {
    int totalQuestion = 10;
    int time = 3;

    void changeTimeExam(newValue) {
      var value = newValue.split(" ")[0];
      var unit = newValue.split(" ")[1];

      if(unit == "câu") {
        totalQuestion = int.parse(value);
      } else if(unit == "phút") {
        time = int.parse(value);
      }
      
      notifyListeners();
    }


}