// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

part of 'models.dart';

ChangePasswordResponseModel changePasswordResponseModelFromJson(String str) => ChangePasswordResponseModel.fromJson(json.decode(str));

String changePasswordResponseModelToJson(ChangePasswordResponseModel data) => json.encode(data.toJson());

class ChangePasswordResponseModel {
  ChangePasswordResponseModel({
      this.status,
      this.message,
      this.data,
      this.error,
  });

  bool status;
  String message;
  dynamic data;
  dynamic error;

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) => ChangePasswordResponseModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] ?? null,
      error: json["error"] ?? null,
  );

  Map<String, dynamic> toJson() => {
      "status": status,
      "message": message,
      "data": data,
      "error": error,
  };
}