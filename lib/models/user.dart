class User {
  int userid;
  String email;
  String username;
  int role;
  String userImage;
  DateTime birthday;

  User({
    required this.userid,
    required this.email,
    required this.username,
    required this.role,
    required this.userImage,
    required this.birthday,
  });

  // ha kívülrő json adat érkezik azt képes legyen fogadni, és feltölteni a paramétereket
  factory User.fromJson(Map<String, dynamic> json) {
    DateTime date = json['birthday'] == null ? DateTime.now() : DateTime.parse(json['birthday'] as String);
    return User(
      userid: json['userID'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      role: json['role'] as int,
      userImage: json['userImage'] as String,
      birthday: date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userID": userid,
      "email": email,
      "username": username,
      "role": role,
      "userImage": userImage,
      "birthday": birthday,
    };
  }
}
