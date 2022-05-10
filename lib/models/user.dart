import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    required this.from,
    required this.to,
  });

  late String username;
  late String from;
  late String to;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "from": from,
        "to": to,
      };
}
