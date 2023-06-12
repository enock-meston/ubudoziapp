import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/model/hejutu_model.dart';
import 'package:http/http.dart' as http;

import '../API_Connection/api_connection.dart';
import '../model/user_profile_model.dart';

class HejuruController extends GetxController {
  UserProfileModel userProfileModel = UserProfileModel();
  var isLoading = true.obs;

  var user = UserProfileModel().obs;
  List<HejuruModel> hejuruDataList = <HejuruModel>[].obs;

 @override
  void onInit() {
    super.onInit();

    getHejuruData();
  }


  Future<void> getHejuruData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    var url = Uri.parse("${API.getHejuruData}?userId=$userId");
    var response = await http.get(Uri.parse("${API.getHejuruData}?userId=$userId"));
    // print(url);
    print("data zo hejuru: ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        hejuruDataList.add(HejuruModel.fromJson(data));
       
        isLoading(false);

      } else {
        print("Error - ${response.statusCode}");
        
      }

    } else {
      print("error - ${response.statusCode}");

    }
      
    }
  }

