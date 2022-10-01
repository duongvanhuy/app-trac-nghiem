import 'package:flutter/cupertino.dart';

class ChangeSettingExamProvider extends ChangeNotifier {
    int totalQuestion = 10 ; //Giá trị mặc đỊnh phải thuộc trong list giá trị được chọn
    int time = 3;

    void changeSettingExam(newValue) {
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