// ignore_for_file: empty_statements, dead_code

part of 'services.dart';

class RegisterServices {
  Future register(RegisterRequestModel requestModel) async {

    var url = Uri.parse("$baseURL/auth/register");

    try {
      final response = await http.post(url, body: requestModel.toJson());

      if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401) {
        // print(response.body);
        return RegisterResponseModel.fromJson(json.decode(response.body));
      }
      else {
        return RegisterResponseModel.fromJson(failed_response);
      }
    }
    catch (e) {
      return RegisterResponseModel.fromJson(failed_response);
    };
  }
}