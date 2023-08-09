import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/API_Connection/api_connection.dart';

import '../model/user_profile_model.dart';
import 'package:http/http.dart' as http;


class UserProfileControler extends GetxController {
// get user Profile method

UserProfileModel userProfileModel = UserProfileModel();
var isLoading = true.obs;
var user = UserProfileModel().obs;

 @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  
    Future getUserProfile() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? userId = sharedPreferences.getString("userId");

      var response = await http.get(Uri.parse("${API.getMyProfile}?userId=$userId"));
      // print("response.body: ${response.body}");

      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // print("getData Two");
      // print(data);

       userProfileModel = UserProfileModel.fromJson(data);
      // print("getData Three");
      // print("my name is: ${userProfileModel.lname}");

      user.value = userProfileModel;
      // print("getData Four");
      // print(user.value.userName);
      isLoading(false);
    } else {
      print("Error - ${response.statusCode}");
      
    }

      } else {
        print("error - ${response.statusCode}");

      }

    }


}
