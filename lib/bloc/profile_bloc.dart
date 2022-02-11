

import 'package:elangsung_test_mobile/models/models.dart';
import 'package:elangsung_test_mobile/services/services.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  final _services = Services();
  final _profileFetcher = PublishSubject<ProfileResponseModel>();
  Stream<ProfileResponseModel> get dataProfile => _profileFetcher.stream;
  fetchDataProfile() async {
    _profileFetcher.sink.add(null);
    ProfileResponseModel profile = await _services.fetchDataProfile();
    _profileFetcher.sink.add(profile);
  }
  dispose() {
    _profileFetcher.close();
  }
}

final profileBloc = ProfileBloc();