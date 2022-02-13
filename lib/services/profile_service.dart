// ignore_for_file: empty_statements, dead_code, prefer_const_constructors, unused_local_variable, await_only_futures, unnecessary_new

part of 'services.dart';

class ProfileServices {
  final _storage = FlutterSecureStorage();

  Future<ProfileResponseModel> getProfile() async {

    var url = Uri.parse("$baseURL/user/profile");

    String token = await _storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token,
    };

    try {
      final response = await http.get(url, headers: requestHeaders);

      if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401) {
        return ProfileResponseModel.fromJson(json.decode(response.body));
      }
      else {
        return ProfileResponseModel.fromJson(failed_response);
      }
    }
    catch (e) {
      return ProfileResponseModel.fromJson(failed_response);
    };
  }

  Future<ProfileUpdateResponseModel> updateProfile(ProfileUpdateRequestModel requestModel) async {

    var url = Uri.parse("$baseURL/user/update-profile");

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
        return ProfileUpdateResponseModel.fromJson(json.decode(response.body));
      }
      else {
        return ProfileUpdateResponseModel.fromJson(failed_response);
      }
    }
    catch (e) {
      return ProfileUpdateResponseModel.fromJson(failed_response);
    };
  }

  Future updateFoto(String filepath) async {
    var url = Uri.parse("$baseURL/user/update-foto");

    String token = await _storage.read(key: 'token');

    http.MultipartRequest request = new http.MultipartRequest(
      'POST',
      url,
    );
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'foto',
      filepath,
    );

    request.files.add(multipartFile);

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      // 'Accept': 'multipart/form-data',
      'Authorization': 'Bearer ' + token,
    });

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

    return response;
  }

}