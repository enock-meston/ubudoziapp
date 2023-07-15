import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:ubudoziapp/controller/hejuru_controller.dart';

import '../../controller/user_profile_controler.dart';

class IbyakozweHejuruFragment extends StatefulWidget {
  @override
  State<IbyakozweHejuruFragment> createState() =>
      _IbyakozweHejuruFragmentState();
}

class _IbyakozweHejuruFragmentState extends State<IbyakozweHejuruFragment> {
  // const IbyakozweFragment({super.key});
  HejuruController hejuruController = Get.put(HejuruController());
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());

  @override
  void initState() {
    // TODO: implement initState
    hejuruController.getHejuruData();
    super.initState();
  }

  Future _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    hejuruController.getHejuruData();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            body: LiquidPullToRefresh(
          height: 200,
          backgroundColor: Color.fromARGB(255, 43, 44, 143),
          animSpeedFactor: 2,
          showChildOpacityTransition: false,
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // title
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage("assets/sewing.png"),
                        color: Color.fromARGB(255, 43, 44, 143),
                        width: 50,
                        height: 30,
                      ),
                      const Spacer(),
                      const Text(
                        "Hejuru",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 44, 143),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // list of ibyakozwe
                // card sample

                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(4),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:
                      hejuruController.hejuruDataList.length, // number of cards

                  itemBuilder: (context, index) {
                    //  print("umubare wa data : ${_hejuruController.hejuruDataList.length}");
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //
                                Text(
                                  "Amazina: ${hejuruController.hejuruDataList[index].clientNames} ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Nimero ya Telephone: ${hejuruController.hejuruDataList[index].phoneNumber}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                // divider
                                Container(
                                  width: 300,
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                // list of ibyakozwe
                                // make sample list if data using listview builder has static default data

                                // confirm button at the left side
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
                                            "Ibitugu/EP: ${hejuruController.hejuruDataList[index].epIbitugu}",
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
                                            "Igituza/LP: ${hejuruController.hejuruDataList[index].lpIgituza}",
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
                                            "Uburebure/LT: ${hejuruController.hejuruDataList[index].ltUburebure}",
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
                                            "Amaboko/LM:${hejuruController.hejuruDataList[index].lmAmaboko}",
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
                                            "Munda/CT: ${hejuruController.hejuruDataList[index].ctMunda}",
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
                                            "Mumatako/CB-CH: ${hejuruController.hejuruDataList[index].cbChAmatako}",
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
                                            "Igikonjo/CM: ${hejuruController.hejuruDataList[index].cmIgikonjo}",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
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
                                            "Ntiradondwa: ${hejuruController.hejuruDataList[index].activeStatus}",
                                            // set condition to change color of status
                                            // check if status is active or not
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: hejuruController
                                                          .hejuruDataList[index]
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
                                              onPressed: () {},
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
                                                String dataId = "${hejuruController.hejuruDataList[index].id}";
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
                                                        "Murifuza Gusiba Burundu? ${hejuruController.hejuruDataList[index].clientNames}",
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
                                                            hejuruController
                                                                .deleteHejuruData(
                                                                    dataId);
                                                          },
                                                          child: Text(
                                                            "Yego",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.red,
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
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
