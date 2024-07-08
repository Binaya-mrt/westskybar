import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class User {
  final String email;
  final int phone;
  final String id;
  final String token;

  User(
      {required this.email,
      required this.phone,
      required this.id,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}






// {
//     "message": "success",
//     "user": {
//         "email": "binaya",
//         "phone": 98383843,
//         "id": "66838b68de04dca9b9da2089",
//         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ODM4YjY4ZGUwNGRjYTliOWRhMjA4OSIsImlhdCI6MTcyMDQyNDA1OCwiZXhwIjoxNzIwNjgzMjU4fQ.i-AcbpLeIuHNM19laI9Yl0XyJyQb7AkCSFvem728txI"
//     }
// }