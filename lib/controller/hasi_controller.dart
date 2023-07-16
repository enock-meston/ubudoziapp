import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API_Connection/api_connection.dart';
import '../model/hasi_model.dart';
import '../model/user_profile_model.dart';
import 'package:http/http.dart' as http;

import '../screens/users/ibyakozwe_hasi.dart';

class HasiController extends GetxController {

   UserProfileModel userProfileModel = UserProfileModel();
  var isLoading = true.obs;

  var user = UserProfileModel().obs;
  
   RxList<HasiModel> hasiDataList = <HasiModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHasiData();
  }

  Future getHasiData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    
    // var url = Uri.parse("${API.getHasiData}?userId=$userId");
    // var url = "http://192.168.1.69/ubudoziweb/android/selectHasi.php";

    var response = await http.get(Uri.parse("${API.getHasiData}?userId=$userId"));
    // print("url $url");
    print("response.body hasi: ${response.body}");

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        hasiDataList.value =  hasiModelsFromJson(jsonEncode(data["data"]));
        hasiDataList.refresh();
        print("data zo HASI / user ni : ${response.body}");
        isLoading(false);

      } else {
        print("Error - ${response.statusCode}");
        
      }

    } else {
      print("error - ${response.statusCode}");

    }
      
    }

    Future deleteHejuruData(String id) async {
      var url = Uri.parse("${API.deleteHasiData}?id=$id");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("data zo hejuru tugendeye ku mu user ni : ${response.body}");
      // dialog
      Get.snackbar("Success", "Data deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    Get.to(IbyakozweHasiFragment());
    } else {
      print("error - ${response.statusCode}");

    }
    }

    
  kwemezaData(String id,String phoneNumber1,String clientNames1) async{
      // send sms to phone 
      // ==========
      String message = "Muraho neza $clientNames1, Ubu umwenda wanyu wo kwambara mwadodesheje "
      "Ubu wamaze kurangira, mwegera Umudozi akawubaha, Murakoze";
  var data = {
    "sender": 'REMS',
    "recipients": "$phoneNumber1",
    "message": "$message",
  };

  var url = Uri.parse("https://www.intouchsms.co.rw/api/sendsms/.json");
  var username = "djeric";
  var password = "Eric@12345";

  var response = await http.post(url,
      headers: <String, String>{
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('$username:$password')),
      },
      body: data);

  if (response.statusCode == 200) {
    // SMS sent successfully
    var result = response.body;
    print(result);
  } else {
    // Error sending SMS
    print('Failed to send SMS. Error code: ${response.statusCode}');
  }


  // update data method in order to change the status of the data
  // ==========
  var url1 = Uri.parse("${API.updateHasiDataStatus}?id=$id");
  var response1 = await http.get(url1);
  if (response1.statusCode == 200) {
    print("data zo hejuru tugendeye ku mu user ni : ${response1.body}");
    // dialog
    Get.snackbar("Success", "Umwenda Mwemejwe neza Ko warangiye!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    Get.to(IbyakozweHasiFragment());
  } else {
    print("error - ${response1.statusCode}");
}
// ==========

// Call the function to send the SMS

      //==========

  
}


}
