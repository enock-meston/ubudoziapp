import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API_Connection/api_connection.dart';
import '../model/hasi_model.dart';
import '../model/user_profile_model.dart';
import 'package:http/http.dart' as http;

class HasiController extends GetxController {

   UserProfileModel userProfileModel = UserProfileModel();
  var isLoading = true.obs;

  var user = UserProfileModel().obs;
  
  List<HasiModel> hasiDataList = <HasiModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getHasiData();
  }

  Future<void> getHasiData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    
    var url = Uri.parse("${API.getHasiData}?userId=$userId");
    var response = await http.get(Uri.parse("${API.getHasiData}?userId=$userId"));
    print(url);
    print("response.body hasi: ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        hasiDataList.add(HasiModel.fromJson(data));
        isLoading(false);

      } else {
        print("Error - ${response.statusCode}");
        
      }

    } else {
      print("error - ${response.statusCode}");

    }
      
    }

}
