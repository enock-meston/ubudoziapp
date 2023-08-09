import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:ubudoziapp/controller/hejuru_controller.dart';

import '../../controller/user_profile_controler.dart';
import '../../model/hejutu_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/card.dart';
import 'hejuru_details.dart';

class IbyakozweHejuruFragment extends StatefulWidget {
  @override
  State<IbyakozweHejuruFragment> createState() =>
      _IbyakozweHejuruFragmentState();
}

class _IbyakozweHejuruFragmentState extends State<IbyakozweHejuruFragment> {
  HejuruController hejuruController = Get.put(HejuruController());
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    await hejuruController.getHejuruData();
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Ibyakozwe Hejuru",
      ),
      body: LiquidPullToRefresh(
        height: 200,
        backgroundColor: Color.fromARGB(255, 43, 44, 143),
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        onRefresh: _handleRefresh,
        child: FutureBuilder<void>(
          future: hejuruController.getHejuruData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black12,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading data'),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(4),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: hejuruController.hejuruDataList.length,
                itemBuilder: (context, index) {
                  var transaction = hejuruController.hejuruDataList[index];
                  return GestureDetector(
  onTap: () {
    // Handle the tap event here
    Get.to(() => HejuruDataDetail(hejuruData: hejuruController.hejuruDataList[index]));
  },
  child: Card(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${hejuruController.hejuruDataList[index].clientNames}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          
          const SizedBox(
            height: 4,
          ),
          // ListTitle
          Row(
            children: [
              Text(
                "Nimero ya Telephone: ${hejuruController.hejuruDataList[index].phoneNumber}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Text("Imiterere:"),
              Text(
                " ${hejuruController.hejuruDataList[index].activeStatus != "1" ? "Yarangiye" : "Ntirasozwa"}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: hejuruController.hejuruDataList[index].activeStatus != "1"
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

                },
              );
            }
          },
        ),
      ),
    );
  }
}
