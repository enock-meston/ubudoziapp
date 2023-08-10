import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/controller/hasi_controller.dart';

import '../../controller/user_profile_controler.dart';
import '../../widgets/app_bar.dart';
import 'hasi_details.dart';

class IbyakozweHasiFragment extends StatefulWidget {
  const IbyakozweHasiFragment({super.key});

  @override
  State<IbyakozweHasiFragment> createState() => _IbyakozweHasiFragmentState();
}

class _IbyakozweHasiFragmentState extends State<IbyakozweHasiFragment> {
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());

  HasiController hasiController = Get.put(HasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ibyakozwe Hasi',
      ),
      body: FutureBuilder<void>(
        future: hasiController.getHasiData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black12),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data'),
            );
          } else {
            return GestureDetector(
              onTap: () {
                // Handle GestureDetector tap event
                // For example, you can implement the delete functionality here
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: hasiController.hasiDataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => HasiDataDetails(
                          hasiData: hasiController.hasiDataList[index]));
                    },
                    child: Card(
                       elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${hasiController.hasiDataList[index].clientNames}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nimero ya Telephone: ${hasiController.hasiDataList[index].phoneNumber}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                Text("Imiterere:"),
                                Text(
                                  " ${hasiController.hasiDataList[index].activeStatus != "1" ? "Yarangiye" : "Ntirasozwa"}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: hasiController
                                                .hasiDataList[index]
                                                .activeStatus !=
                                            "1"
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
              ),
            );
          }
        },
      ),
    );
  }
}
