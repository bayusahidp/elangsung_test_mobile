// ignore_for_file: empty_statements, dead_code

part of 'services.dart';

class LoginServices {
  Future login(LoginRequestModel requestModel) async {

    var url = Uri.parse("$baseURL/auth/login");

    try {
      final response = await http.post(url, body: requestModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401) {
        // print(response.body);
        return LoginResponseModel.fromJson(json.decode(response.body));
      }
      else {
        return LoginResponseModel.fromJson(failed_response);
      }
    }
    catch (e) {
      return LoginResponseModel.fromJson(failed_response);
    };
  }
}