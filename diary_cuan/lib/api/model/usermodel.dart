import 'dart:convert';

class UserModel {
  String id_user;
  String email;
  String password;
  String username;

  UserModel({
    required this.id_user,
    required this.email,
    required this.password,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id_user: map["id_user"],
      email: map["email"],
      password: map["password"],
      username: map["username"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_user": id_user,
      "email": email,
      "password": password,
      "username": username,
    };
  }

  @override
  String toString() {
    return 'User{id_user: $id_user, email: $email, password: $password,username: $username }';
  }
}

List<UserModel> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<UserModel>.from(
      data.map((item) => UserModel.fromJson(item)));
}

String userToJson(UserModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}