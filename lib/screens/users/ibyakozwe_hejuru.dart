import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/controller/hejuru_controller.dart';

import '../../controller/user_profile_controler.dart';

class IbyakozweHejuruFragment extends StatefulWidget {

  @override
  State<IbyakozweHejuruFragment> createState() =>
      _IbyakozweHejuruFragmentState();
}

class _IbyakozweHejuruFragmentState extends State<IbyakozweHejuruFragment> {
  // const IbyakozweFragment({super.key});
  final HejuruController hejuruController = Get.put(HejuruController());
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());

  @override
  void initState() {
    // TODO: implement initState
    hejuruController.getHejuruData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
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
             ),     ),
            
          
          
          
            const SizedBox(
              height: 20,
            ),
          
            // list of ibyakozwe
            // card sample
          
            ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: hejuruController.hejuruDataList.length, // number of cards
             
              itemBuilder: (context, index) {
                //  print("umubare wa data : ${_hejuruController.hejuruDataList.length}");
                return Card(
                  
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            Text(
                              "${hejuruController.hejuruDataList[index].clientNames} ",
                              
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              "${hejuruController.hejuruDataList[index].phoneNumber}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // list of ibyakozwe
                            // make sample list if data using listview builder has static default data
          
                            // confirm button at the left side
                            Column(
                              children: [
                                // row ya mbere
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    // from left
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ibitugu: 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
          
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    // from left
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ibitugu: 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
          
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    // from left
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ibitugu: 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Igituza : 23",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
          
                                      SizedBox(
                                        width: 10,
                                      ),
          
                                      // button yo kwemeza
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Kwemeza",
                                            style: TextStyle(
                                              fontSize: 10,
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
    )
    );
  }
}
