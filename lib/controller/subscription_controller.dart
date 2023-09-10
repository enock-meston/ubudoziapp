import 'dart:convert';

import 'package:get/get.dart';
import 'package:ubudoziapp/model/subscription_model.dart';

import '../API_Connection/api_connection.dart';
import 'package:http/http.dart' as http;

class SubScriptionController extends GetxController{
    var isLoading = true.obs;
    var subscriptionDataList = <SubScriptionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

    Future<void> getSubscription() async{
      var response = await http.get(Uri.parse("${API.selectSubscription}"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData.containsKey('data') && jsonData['data'] is List) {
           var items = jsonData['data'];
      var tempList = <SubScriptionModel>[]; // Create a temporary list

      for (var i in items) {
        SubScriptionModel _subscriptionModel = SubScriptionModel.fromJson(i);
        tempList.add(
          SubScriptionModel(
            subId: _subscriptionModel.subId,
            title: _subscriptionModel.title,
            amount: _subscriptionModel.amount,
            duration: _subscriptionModel.duration,
            status: _subscriptionModel.status,
            dateOn: _subscriptionModel.dateOn,
          ),
        );
      }
      
      subscriptionDataList.assignAll(tempList); // Replace existing list with new data
      isLoading.value = false;
      update();
        } else {
          print("the data is not a list");
        }
      }else{
        print("Error ${response.statusCode}");
      }
    }

}