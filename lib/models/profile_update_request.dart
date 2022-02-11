part of 'models.dart';

class ProfileUpdateRequestModel {
  String name;
  String username;
  String email;
  String fakultas;
  String jurusan;
  String alamat;

  ProfileUpdateRequestModel({this.name, this.email, this.fakultas, this.jurusan, this.username, this.alamat});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> profileUpdateRequest = {
      'name': name.trim(),
      'email': email.trim(),
      'username': username.trim(),
      'fakultas': fakultas.trim(),
      'jurusan': jurusan.trim(),
      'alamat': alamat.trim(),
    };

    return profileUpdateRequest;
  }
}