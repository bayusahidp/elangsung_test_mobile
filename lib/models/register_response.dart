// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

part of 'models.dart';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
      this.status,
      this.message,
      this.data,
      this.error,
  });

  bool status;
  String message;
  DataRegister data;
  dynamic error;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] != null ? DataRegister.fromJson(json["data"]) : null,
      error: json["error"] ?? null,
  );

  Map<String, dynamic> toJson() => {
      "status": status,
      "message": message,
      "data": data != null ? data.toJson() : null,
      "error": error,
  };
}

class DataRegister {
  DataRegister({
      this.user,
  });

  User user;

  factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister(
      user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
      "user": user.toJson(),
  };
}