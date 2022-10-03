class User {
  // String? accessToken = "";
  // int expireInSeconds = 0;
  // String lastLogin = "";
  int? id;
  String? username;
  // String fullName = "";
  String? email;
  String? password;
  // String userMeta = "";
  // User.empty();
  User({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  // this.userMeta,

  Map<String, dynamic> toMap() => {
        // 'accessToken': accessToken,
        // 'expireInSeconds': expireInSeconds,
        // 'lastLogin': lastLogin,
        'id': id,
        'username': username,
        'email': email,
        // 'fullName': fullName,
        'password': password,
        // 'userMeta': userMeta,
      };

  // fromJson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // accessToken: json['accessToken'],
      // expireInSeconds: json['expireInSeconds'],
      // lastLogin: json['lastLogin'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      // fullName: json['fullName'],
      password: json['password'],
      // userMeta: json['userMeta'],
    );
  }

  // toString
  @override
  String toString() {
    return 'User{userId: $id, userName: $username, userEmail: $email, password: $password}';
  }
}
