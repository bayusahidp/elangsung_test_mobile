part of 'models.dart';

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({this.username, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> loginRequest = {
      'username': username.trim(),
      'password': password.trim()
    };

    return loginRequest;
  }
}