class User {
  String accessToken = "";
  int expireInSeconds = 0;
  String lastLogin = "";
  int userId = 0;
  String userName = "";
  String fullName = "";
  String userEmail = "";
  String password = "";
  String userMeta = "";
  User.empty();
  User(
      this.accessToken,
      this.expireInSeconds,
      this.lastLogin,
      this.userId,
      this.userName,
      this.userEmail,
      this.fullName,
      this.password,
      this.userMeta);

  Map<String, dynamic> toMap() => {
        "accessToken": accessToken,
        "expireInSeconds": expireInSeconds,
        "lastLogin": lastLogin,
        "userId": userId,
        "userName": userName,
        "userEmail": userEmail,
        "fullName": fullName,
        "password": password,
        "userMeta": userMeta,
      };
}
