// ignore_for_file: prefer_const_constructors

part of 'services.dart';

class LogoutServices {
  final _storage = FlutterSecureStorage();

  Future logout() async {

    var url = Uri.parse("$baseURL/auth/logout");

    String token = await _storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

    try {
      final response = await http.post(url, headers: requestHeaders);

      if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401) {
        return ChangePasswordResponseModel.fromJson(json.decode(response.body));
      }
      else {
        return ChangePasswordResponseModel.fromJson(failed_response);
      }
    }
    catch (e) {
      return ChangePasswordResponseModel.fromJson(failed_response);
    }
  }
}