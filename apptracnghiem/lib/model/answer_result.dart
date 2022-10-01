class AnswerResult {
// right sentence
// wrong sentence
// undone sentence
  int? totalCount;
  int? rightCount;
  int? wrongCount;
  int? undoneCount;
  int? idUser;
  int? idTopic;

  // contractor
  AnswerResult(
      {this.totalCount,
      this.rightCount,
      this.wrongCount,
      this.undoneCount,
      this.idUser,
      this.idTopic});
  // fromToJson
  factory AnswerResult.fromJson(Map<String, dynamic> json) {
    return AnswerResult(
        totalCount: json['totalCount'],
        rightCount: json['rightCount'],
        wrongCount: json['wrongCount'],
        undoneCount: json['undoneCount'],
        idUser: json['idUser'],
        idTopic: json['idTopic']);
  }
}
