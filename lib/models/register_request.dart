part of 'models.dart';

class RegisterRequestModel {
  String name;
  String username;
  String email;
  String password;
  String fakultas;
  String jurusan;

  RegisterRequestModel({this.name, this.email, this.fakultas, this.jurusan, this.username, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> registerRequest = {
      'name': name.trim(),
      'email': email.trim(),
      'username': username.trim(),
      'password': password.trim(),
      'fakultas': fakultas.trim(),
      'jurusan': jurusan.trim(),
    };

    return registerRequest;
  }
}