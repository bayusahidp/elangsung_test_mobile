part of 'models.dart';

class ChangePasswordRequestModel {
  String password;
  String newpassword;
  String confirmpassword;

  ChangePasswordRequestModel({this.password, this.newpassword, this.confirmpassword});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> changePasswordRequest = {
      'password': password.trim(),
      'newpassword': newpassword.trim(),
      'confirmpassword': confirmpassword.trim(),
    };

    return changePasswordRequest;
  }
}