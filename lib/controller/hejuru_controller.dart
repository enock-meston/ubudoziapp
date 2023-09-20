import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/model/hejutu_model.dart';
import 'package:http/http.dart' as http;

import '../API_Connection/api_connection.dart';
import '../model/user_profile_model.dart';
import '../screens/users/ibyakozwe_hejuru.dart';

class HejuruController extends GetxController {
  UserProfileModel userProfileModel = UserProfileModel();
  var isLoading = true.obs;

  var user = UserProfileModel().obs;
  var hejuruDataList = <HejuruModel>[].obs;

//  @override
//   void onInit() {
//     super.onInit();
//     getHejuruData();
//   }

  // use on initstate() in the stateful widget
  @override  
  void onInitState() {
    super.onInit();
    getHejuruData();
  }
  


Future<void> getHejuruData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString("userId");
  
  var url = Uri.parse("${API.getHejuruData}?userId=$userId");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    
    if (jsonData.containsKey('data') && jsonData['data'] is List) {
      var items = jsonData['data'];
      List<HejuruModel> newList = []; // Create a new list to hold the items
      
      for (var i in items) {
        HejuruModel _hejuruModel = HejuruModel.fromJson(i);
        newList.add(
          HejuruModel(
            id: _hejuruModel.id,
            clientNames: _hejuruModel.clientNames,
            phoneNumber: _hejuruModel.phoneNumber,
            ePIbitugu: _hejuruModel.ePIbitugu,
            lPIgituza: _hejuruModel.lPIgituza,
            lTUburebure: _hejuruModel.lTUburebure,
            lMAmaboko: _hejuruModel.lMAmaboko,
            cMIgikonjo: _hejuruModel.cMIgikonjo,
            cTMunda: _hejuruModel.cTMunda,
            cBCHAmatako: _hejuruModel.cBCHAmatako,
            activeStatus: _hejuruModel.activeStatus,
            ubudoziID: _hejuruModel.ubudoziID,
          ),
        );
      }
      
      // Clear the old list and update with the new one
      hejuruDataList.clear();
      hejuruDataList.addAll(newList);
      
      isLoading.value = false;
      update();
    } else {
      print('Data does not contain an iterable part.');
    }
  } else {
    print("error - ${response.statusCode}");
  }
}

    deleteHejuruData(String id) async {
    var url = Uri.parse("${API.deleteHejuruData}?id=$id");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("data zo hejuru tugendeye ku mu user ni : ${response.body}");
      // dialog
      Get.snackbar("Success", "Data deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    Get.to(IbyakozweHejuruFragment());
    } else {
      print("error - ${response.statusCode}");

    }
  }

  kwemezaData(String id,String phoneNumber1,String clientNames1) async{
      // send sms to phone 
      // ==========
      String message = "Muraho neza $clientNames1, Ubu umwenda wanyu wo kwambara mwadodesheje Ubu wamaze kurangira, mwegera Umudozi akawubaha, Murakoze";
  var data = {
    "sender": 'Nigoote ltd',
    "recipients": "$phoneNumber1",
    "message": "$message",
  };

  var url = Uri.parse("https://www.intouchsms.co.rw/api/sendsms/.json");
  var username = "nigoote.ltd";
  var password = "Enock@123";

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
  var url1 = Uri.parse("${API.updateHejuruDataStatus}?id=$id");
  var response1 = await http.get(url1);
  if (response1.statusCode == 200) {
    print("data zo hejuru tugendeye ku mu user ni : ${response1.body}");
    // dialog
    Get.snackbar("Success", "Umwenda Mwemejwe neza Ko warangiye!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    Get.to(IbyakozweHejuruFragment());
  } else {
    print("error - ${response1.statusCode}");
}
// ==========

// Call the function to send the SMS

      //==========

  
}

}