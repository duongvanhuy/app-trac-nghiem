import 'package:apptracnghiem/model/question.dart';

class Topic {
  int? id;
  String? name;
  List<Question>? items;

  // contractor
  Topic({this.id, this.name, this.items});
  // function fromJson
  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
        id: json['id'],
        name: json['name'],
        items: json['items'] != null
            ? (json['items'] as List).map((i) => Question.fromJson(i)).toList()
            : null);
  }
}
