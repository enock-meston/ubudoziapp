import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/API_Connection/api_connection.dart';

import '../model/user_profile_model.dart';
import 'package:http/http.dart' as http;


class UserProfileControler extends GetxController {
  UserProfileModel userProfileModel = UserProfileModel();
  var isLoading = true.obs;
  var user = UserProfileModel().obs;

  Future<UserProfileModel> getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    var response = await http.get(Uri.parse("${API.getMyProfile}?userId=$userId"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      userProfileModel = UserProfileModel.fromJson(data);
      user.value = userProfileModel;
      isLoading(false);
      return userProfileModel;
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
