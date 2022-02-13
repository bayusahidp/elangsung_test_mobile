import 'dart:convert';
import 'dart:async';
import 'package:elangsung_test_mobile/models/models.dart';
import 'package:elangsung_test_mobile/shared/shared.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'login_service.dart';
part 'register_service.dart';
part 'profile_service.dart';
part 'change_password_service.dart';
part 'logout_service.dart';

class Services {
  final loginServices = LoginServices();
  final registerServices = RegisterServices();
  final profileServices = ProfileServices();
  final logoutServices = LogoutServices();

  Future<ProfileResponseModel> fetchDataProfile() => profileServices.getProfile();

}