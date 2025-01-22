

import '../../domain/entities/SignupEntity.dart';
import 'User.dart';

/// message : "success"
/// statusMsg : ""
/// user : {"name":"Ahmed Mustafa","email":"ahmed.abuhargajhv10@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NmI5NDQ0N2Q5Y2Q2OTdmZmQzYWE0NyIsIm5hbWUiOiJBaG1lZCBNdXN0YWZhIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzUxMDM1NTcsImV4cCI6MTc0Mjg3OTU1N30.tYMQR8ZuFjoTYrSsvBoHjt9Bd8wyCbsDYjSA3Z5wIes"

class SignupResponse {
  SignupResponse({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  SignupResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  SignupEntity toSignupEntity()
  {
    return SignupEntity(
      token: token,
    ) ;
  }

}