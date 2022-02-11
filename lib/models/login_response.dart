// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_null_aware_operators

part of 'models.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        this.status,
        this.message,
        this.data,
        this.error,
    });

    bool status;
    String message;
    DataLogin data;
    dynamic error;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null ? DataLogin.fromJson(json["data"]) : null,
        error: json["error"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null ? data.toJson() : null,
        "error": error,
    };
}

class DataLogin {
    DataLogin({
        this.token,
        this.tokenType,
        this.user,
    });

    String token;
    String tokenType;
    User user;

    factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        token: json["token"],
        tokenType: json["token_type"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user.toJson(),
    };
}

class User {
    User({
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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