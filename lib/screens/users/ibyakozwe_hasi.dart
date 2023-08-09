import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/controller/hasi_controller.dart';

import '../../controller/user_profile_controler.dart';
import '../../widgets/app_bar.dart';

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
  void initState() {
    // hasiController.getHasiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(
            title: 'Ibyakozwe Hasi',
            
          ),
          body: SingleChildScrollView(
            child: // check is datas are empty show circular progress indicator
                hasiController.hasiDataList.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(color: Colors.black12,),
                        ),
                    )
                    :ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(4),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: hasiController.hasiDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                                  "Amazina: ${hasiController.hasiDataList[index].clientNames} ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Nimero ya Telephone: ${hasiController.hasiDataList[index].phoneNumber}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),

                                // =====
                                 Column(
                                  children: [
                                    // row ya mbere
                                    Container(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        // from left
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Munda/CT: ${hasiController.hasiDataList[index].cTMunda}",
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
                                            "Mumatako/LP: ${hasiController.hasiDataList[index].lPMumatako}",
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
                                            "Ibibero/CC: ${hasiController.hasiDataList[index].cCIbibero}",
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
                                            "Uburebure/LT:${hasiController.hasiDataList[index].lTUburebure}",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mumavi/CJ: ${hasiController.hasiDataList[index].cJMumavi}",
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
                                            "Mukirenge/TB: ${hasiController.hasiDataList[index].tBMukirenge}",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // status
                                          Text(
                                            "Imiterere: ${hasiController.hasiDataList[index].activeStatus != "1"
                                            ? "Yarangiye" : "Ntirasozwa"} ",
                                            // set condition to change color of status
                                            // check if status is active or not
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: hasiController.hasiDataList[index]
                                                          .activeStatus !=
                                                      "1"
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                          // button yo kwemeza
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // get data id
                                                String dataId1 =
                                                    "${hasiController.hasiDataList[index].id}";
                                                String phoneNumber1 =
                                                    "${hasiController.hasiDataList[index].phoneNumber}";
                                                String clientNames1 =
                                                    "${hasiController.hasiDataList[index].clientNames}";
                                                print(" my name $clientNames1");
                                                // ask for confirmation
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        "Kwemeza",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      content: Text(
                                                        "Mugiye Kwemeza ko mwasoje kudoda uyu Mwenda !",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            // close dialog
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Oya",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            // close dialog
                                                            Navigator.pop(
                                                                context);
                                                            // call function to update data
                                                            hasiController
                                                                .kwemezaData(
                                                                    dataId1,
                                                                    phoneNumber1,clientNames1);
                                                          },
                                                          child: Text(
                                                            "Yego",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.green,
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
                                                primary: Color.fromARGB(
                                                    255, 43, 44, 143),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // delete button
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // get data id
                                                String dataId =
                                                    "${hasiController.hasiDataList[index].id}";
                                                // ask for confirmation
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        "Siba",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      content: Text(
                                                        "Murifuza Gusiba Burundu? ${hasiController.hasiDataList[index].clientNames}",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Oya",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            // call delete function
                                                            hasiController
                                                                .deleteHasiData(
                                                                    dataId);
                                                          },
                                                          child: Text(
                                                            "Yego",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
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
                                // ================== end of card ==================
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
