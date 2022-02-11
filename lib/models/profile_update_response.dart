// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

part of 'models.dart';

ProfileUpdateResponseModel profileUpdateResponseModelFromJson(String str) => ProfileUpdateResponseModel.fromJson(json.decode(str));

String profileUpdateResponseModelToJson(ProfileUpdateResponseModel data) => json.encode(data.toJson());

class ProfileUpdateResponseModel {
  ProfileUpdateResponseModel({
      this.status,
      this.message,
      this.data,
      this.error,
  });

  bool status;
  String message;
  dynamic data;
  dynamic error;

  factory ProfileUpdateResponseModel.fromJson(Map<String, dynamic> json) => ProfileUpdateResponseModel(
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