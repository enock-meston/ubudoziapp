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
  RxList<HejuruModel> hejuruDataList = <HejuruModel>[].obs;

 @override
  void onInit() {
    super.onInit();
    getHejuruData();
  }


   getHejuruData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    print ("user id nii : $userId");
    var url = Uri.parse("${API.getHejuruData}?userId=$userId");
    // print("url ni : $url");
    var response = await http.get(url);
    // print(url);
    // print("data zo hejuru: ${response.body}");

    if (response.statusCode == 200) {
       var data = jsonDecode(response.body);
    
      
     ///run
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        hejuruDataList.value =  hejuruModelsFromJson(jsonEncode(data["data"]));
        hejuruDataList.refresh();
        print(hejuruDataList.length);
        
       
       print("data zo hejuru tugendeye ku mu user ni : ${response.body}");

      //   List data1 = json.decode(response.body);
      // return data1.map((job) => new HejuruModel.fromJson(job)).toList();

        isLoading(false);

      } else {
        print("Error - ${response.statusCode}");
        
      }

    } else {
      print("error - ${response.statusCode}");

    }
      
    }
  }

