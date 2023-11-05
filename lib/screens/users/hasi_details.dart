import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/model/hasi_model.dart';

import '../../controller/hasi_controller.dart';
import '../../widgets/app_bar.dart';

class HasiDataDetails extends StatelessWidget {
  final HasiModel hasiData;
  HasiDataDetails({required this.hasiData});

  HasiController hasiController = Get.put(HasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: hasiData.clientNames ?? "",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 400,
          height: 260,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Amazina: ${hasiData.clientNames}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Nimero ya Telephone: ${hasiData.phoneNumber}",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                        Divider(color: Colors.grey),
                        SizedBox(height: 16),
                        // row ya mbere
                        Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            // from left
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Munda/CT: ${hasiData.cTMunda}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Mumatako/LP: ${hasiData.lPMumatako}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Ibibero/CC: ${hasiData.cCIbibero}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Uburebure/LT:${hasiData.lTUburebure}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            // from left
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Mumavi/CJ: ${hasiData.cJMumavi}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Mukirenge/TB: ${hasiData.tBMukirenge}",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),

                        // divider
                        Container(
                          width: 300,
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            // from left
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // status
                              Text(
                                "Imiterere: ${hasiData.activeStatus != "1" ? "Yarangiye" : "Ntirasozwa"} ",
                                // set condition to change color of status
                                // check if status is active or not
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: hasiData.activeStatus != "1"
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              // button yo kwemeza
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // get data id
                                    String dataId1 = "${hasiData.id}";
                                    String phoneNumber1 =
                                        "${hasiData.phoneNumber}";
                                    String clientNames1 =
                                        "${hasiData.clientNames}";
                                    print(" my name $clientNames1");
                                    // ask for confirmation
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            "Kwemeza",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: Text(
                                            "Mugiye Kwemeza ko mwasoje kudoda uyu Mwenda !",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                // close dialog
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Oya",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // close dialog
                                                Navigator.pop(context);
                                                // call function to update data
                                                hasiController.kwemezaData(
                                                    dataId1,
                                                    phoneNumber1,
                                                    clientNames1);
                                              },
                                              child: Text(
                                                "Yego",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Kwemeza",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 43, 44, 143),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              // delete button
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // get data id
                                    String dataId = "${hasiData.id}";
                                    // ask for confirmation
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            "Siba",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                          content: Text(
                                            "Murifuza Gusiba Burundu? ${hasiData.clientNames}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Oya",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // call delete function
                                                hasiController
                                                    .deleteHasiData(dataId);
                                              },
                                              child: const Text(
                                                "Yego",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Siba",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                // edit
                              ),
                              // edit icon
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // get data id
                                    String dataId = "${hasiData.id}";
                                    // call function to update data
                                    // hasiController.updateHasiData(dataId);
                                  },
                                  child: const Text(
                                    "Hindura",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          // row ya kabiri
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
