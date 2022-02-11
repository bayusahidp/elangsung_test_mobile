// ignore_for_file: empty_statements, dead_code, prefer_const_constructors, unused_local_variable

part of 'services.dart';

class ChangePasswordServices {
  final _storage = FlutterSecureStorage();

  Future<ChangePasswordResponseModel> changePassword(ChangePasswordRequestModel requestModel) async {

    var url = Uri.parse("$baseURL/user/change-password");

    String token = await _storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

    try {
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: requestModel.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401) {
        // print(response.body);
        return ChangePasswordResponseModel.fromJson(json.decode(response.body));
      }
      else {
        return ChangePasswordResponseModel.fromJson(failed_response);
      }
    }
    catch (e) {
      return ChangePasswordResponseModel.fromJson(failed_response);
    };
  }
}