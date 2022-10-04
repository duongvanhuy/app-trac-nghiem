class AnswerResult {
  int? totalCount;
  int? rightCount;
  int? wrongCount;
  int? undoneCount;
  String? timeExam;
  int? idUser;
  int? idTopic;

  // contractor
  AnswerResult(
      {this.totalCount,
      this.rightCount,
      this.wrongCount,
      this.undoneCount,
      this.timeExam,
      this.idUser,
      this.idTopic});
  // fromToJson
  factory AnswerResult.fromJson(Map<String, dynamic> json) {
    return AnswerResult(
        totalCount: json['totalCount'],
        rightCount: json['rightCount'],
        wrongCount: json['wrongCount'],
        timeExam: json['timeExam'],
        undoneCount: json['undoneCount'],
        idUser: json['idUser'],
        idTopic: json['idTopic']);
  }
}
