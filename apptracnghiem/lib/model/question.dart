class Question {
  String? id;
  String? questionName;
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? answerCorrect;
  String? image;
  String? topicId;
  // contractor
  Question(
      {this.id,
      this.questionName,
      this.answerA,
      this.answerB,
      this.answerC,
      this.answerD,
      this.answerCorrect,
      this.image,
      this.topicId});
  // function f
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['id'],
        questionName: json['questionName'],
        answerA: json['answerA'],
        answerB: json['answerB'],
        answerC: json['answerC'],
        answerD: json['answerD'],
        answerCorrect: json['answerCorrect'],
        image: json['image'],
        topicId: json['topicId']);
  }
}
