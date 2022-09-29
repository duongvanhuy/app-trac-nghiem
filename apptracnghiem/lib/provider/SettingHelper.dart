import 'dart:convert';

// import model user
import 'package:apptracnghiem/model/user.dart';
import 'package:apptracnghiem/model/app.dart';
import 'package:flutter/material.dart';

class SettingHelper {
  static const List<IconData> icons = [
    Icons.anchor,
    Icons.score,
    Icons.directions_boat,
    Icons.view_in_ar,
    Icons.rowing_outlined,
    Icons.alt_route_rounded
  ];
  static const List<Color> colors = [
    Colors.amber,
    Colors.redAccent,
    Colors.blue,
    Colors.green,
    Colors.deepPurple,
    Colors.deepOrange
  ];

  static const String TAG = 'IWESettings';

  static const String KEY_IWE_SETTINGS = 'IWE_Settings';
  static const String KEY_IWE_SHARED_PREFERENCES = 'IWE_shared_preferences';
  static const String KEY_IWE_ExamTopics = 'ExamTopics';
  static const String KEY_IWE_PracticeTopics = 'PracticeTopics';
  static const String KEY_IWE_User = 'User';

  static const String KEY_IWE_AppSetting = 'AppSetting';

  static const String KEY_IWE_THUYTHU = 'THUYTHU';
  static const String KEY_IWE_THOMAY = 'THOMAY';
  static const String KEY_IWE_THUYENTRUONG = 'THUYENTRUONG';
  static const String KEY_IWE_LAIPHUONGTIEN = 'QuestionVehicleDriver';
  static const String KEY_IWE_ANTOANLAMVIEC = 'ANTOANLAMVIEC';

  static const int KEY_IWE_Level_HangNhat = 1;
  static const int KEY_IWE_Level_HangHai = 2;

  // static List<Meta> metaList = [];
  // static List<Topic> examTopics = [];
  // static List<Topic> practiceTopics = [];
  static User user = new User("", 0, '', 0, '', '', '', '', '');
  static String apiURL = "https://api.huego.vifiretek.vn";
  //static App appSetting = new App("", "", 0, 0);
  // static List<Question> questionBank = [];

  // static Future<void> init() async {
  //   try {
  //     Logger(TAG).info('Try to load configuration from shared preferences');
  //     await GlobalConfiguration().loadFromAsset("app_settings");
  //     final prefs = await SharedPreferences.getInstance();
  //     var persistent = prefs.getString(KEY_IWE_SHARED_PREFERENCES);
  //     if (persistent != null) {
  //       Map<String, dynamic> persistentAsMap = json.decode(persistent);
  //       GlobalConfiguration().addValue(KEY_IWE_SETTINGS, persistentAsMap);
  //     }
  //     //1.
  //     loadSetting();
  //   } catch (e) {
  //     print(e);
  //     Logger(TAG).info(
  //         'Could not load configuration from shared preferences because of $e');
  //   }
  // }

  // static Map<String, dynamic> sp() =>
  //     GlobalConfiguration().get(KEY_IWE_SETTINGS);

  // static dynamic updateSp(String key, dynamic value) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var persistent = prefs.getString(KEY_IWE_SHARED_PREFERENCES);
  //   Map<String, dynamic> persistentAsMap;
  //   if (persistent != null) {
  //     persistentAsMap = json.decode(persistent);
  //   } else {
  //     persistentAsMap = {};
  //   }
  //   persistentAsMap[key] = value;
  //   persistent = json.encode(persistentAsMap);
  //   await prefs.setString(KEY_IWE_SHARED_PREFERENCES, persistent);
  //   if (GlobalConfiguration().get(KEY_IWE_SETTINGS) != null) {
  //     GlobalConfiguration().updateValue(KEY_IWE_SETTINGS, persistentAsMap);
  //   } else {
  //     GlobalConfiguration().addValue(KEY_IWE_SETTINGS, persistentAsMap);
  //   }
  //   return value;
  // }

  // static void loadSetting() {
  //   final dynamic persistentAsMap = GlobalConfiguration().get(KEY_IWE_SETTINGS);

  //   var appMaps = persistentAsMap[KEY_IWE_AppSetting];

  //   var examMaps = persistentAsMap[KEY_IWE_ExamTopics];
  //   var practiceMaps = persistentAsMap[KEY_IWE_PracticeTopics];
  //   var userMaps = persistentAsMap[KEY_IWE_User];

  //   parserExamTopics(examMaps);

  //   parserPracticeTopics(practiceMaps);

  //   parserUser(userMaps);

  //   parserAppSetting(appMaps);
  // }

  // static void saveSetting() {
  //   dynamic userMap = SettingHelper.user.toMap();
  //   dynamic appSettingMap = SettingHelper.appSetting.toMap();
  //   List<dynamic> examsMaps = [];
  //   examTopics.forEach((element) {
  //     examsMaps.add(element.toMap());
  //   });

  //   List<dynamic> practiceMaps = [];
  //   practiceTopics.forEach((element) {
  //     practiceMaps.add(element.toMap());
  //   });
  //   updateSp(KEY_IWE_User, userMap);
  //   updateSp(KEY_IWE_AppSetting, appSettingMap);
  //   updateSp(KEY_IWE_ExamTopics, examsMaps);
  //   updateSp(KEY_IWE_PracticeTopics, practiceMaps);
  // }

  // static void parserExamTopics(dynamic examMaps) {
  //   if (examMaps.length > 0) {
  //     examTopics = List.generate(examMaps.length, (i) {
  //       return Topic(
  //         examMaps[i]['name'],
  //         examMaps[i]['id'],
  //         examMaps[i]['numOf'],
  //         examMaps[i]['type'],
  //         examMaps[i]['questionIDs'],
  //         examMaps[i]['percent'],
  //         examMaps[i]['status'],
  //         examMaps[i]['enable'],
  //       );
  //     });
  //   } else {
  //     examTopics = Helper.genExamTopics();
  //   }
  // }

  // static void parserPracticeTopics(dynamic practiceMaps) {
  //   if (practiceMaps.length > 0) {
  //     practiceTopics = List.generate(practiceMaps.length, (i) {
  //       return Topic(
  //         practiceMaps[i]['name'],
  //         practiceMaps[i]['id'],
  //         practiceMaps[i]['numOf'],
  //         practiceMaps[i]['type'],
  //         practiceMaps[i]['questionIDs'],
  //         practiceMaps[i]['percent'],
  //         practiceMaps[i]['status'],
  //         practiceMaps[i]['enable'],
  //       );
  //     });
  //   }
  // }

  // static void parserUser(dynamic userMap) {
  //   print('parserUser${userMap['expireInSeconds']}');
  //   user = User(
  //       userMap['accessToken'],
  //       userMap['expireInSeconds'],
  //       userMap['lastLogin'],
  //       userMap['userId'],
  //       userMap['userName'],
  //       userMap['userEmail'],
  //       userMap['fullName'],
  //       userMap['password'],
  //       userMap['userMeta']);
  //   print('parserUser${userMap['userId']}');
  // }

  // static void parserAppSetting(dynamic appMaps) {
  //   appSetting = App(appMaps['apiURL'], appMaps['endPoint'], appMaps['level'],
  //       appMaps['timer']);
  // }

  // static void updateTopic(Topic topic) {
  //   examTopics[examTopics.indexWhere((element) => element.id == topic.id)] =
  //       topic;
  // }
}
