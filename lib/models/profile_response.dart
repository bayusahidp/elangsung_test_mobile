// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

part of 'models.dart';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
    ProfileResponseModel({
        this.status,
        this.message,
        this.data,
        this.error,
    });

    bool status;
    String message;
    DataProfile data;
    dynamic error;

    factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null ? DataProfile.fromJson(json["data"]) : null,
        error: json["error"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null ? data.toJson() : null,
        "error": error,
    };
}

class DataProfile {
    DataProfile({
        this.id,
        this.name,
        this.email,
        this.username,
        this.fakultas,
        this.jurusan,
        this.alamat,
        this.foto,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    String name;
    String email;
    String username;
    String fakultas;
    String jurusan;
    dynamic alamat;
    dynamic foto;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        fakultas: json["fakultas"],
        jurusan: json["jurusan"],
        alamat: json["alamat"],
        foto: json["foto"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "fakultas": fakultas,
        "jurusan": jurusan,
        "alamat": alamat,
        "foto": foto,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
