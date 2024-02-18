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

  bool isAdmin() {
    return (role == 1);
  }

  // ha kívülről json adat érkezik azt képes legyen fogadni
  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    DateTime date = json['birthday'] == null ? DateTime.now() : DateTime.parse(json['birthday'] as String);
    print(date);
    return User(
      userid: json['userID'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      role: json['role'] as int,
      userImage: json['userImage'] as String,
      birthday: date,
    );
  }

  // kifelé tudjunk JSON-t küldeni az adatainkból
  Map<String, dynamic> toJson() {
    return {"userid": userid, "email": email, "username": username, "role": role, "userImage": userImage, "birthday": birthday};
  }
}
