import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/API_Connection/api_connection.dart';

import '../../controller/user_profile_controler.dart';
import '../../model/hejutu_model.dart';
import '../../widgets/app_bar.dart';
import 'ibyakozwe_hejuru.dart';

class HejuruFragment extends StatelessWidget {
  //user profile controller
  final UserProfileControler _userProfileControler =
      Get.put(UserProfileControler());

 

// form key declaration
  var formKey = GlobalKey<FormState>();

  var clientNames = TextEditingController();
  var phoneNumber = TextEditingController();
  var EP_ibitugu = TextEditingController();
  var LP_igituza = TextEditingController();
  var LT_uburebure = TextEditingController();
  var LM_amaboko = TextEditingController();
  var CM_Igikonjo = TextEditingController();
  var CT_munda = TextEditingController();
  var CB_CH_Amatako = TextEditingController();

// kubika Hejuru method
  // ignore: non_constant_identifier_names
  void KubikaHejuru() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // get my id
    String myID = prefs.getString("userId").toString();

    HejuruModel hejuruModel = HejuruModel(
      id: "",
      clientNames: clientNames.text,
      phoneNumber: phoneNumber.text,
      ePIbitugu: EP_ibitugu.text,
      lPIgituza: LP_igituza.text,
      lTUburebure: LT_uburebure.text,
      lMAmaboko: LM_amaboko.text,
      cMIgikonjo: CM_Igikonjo.text,
      cTMunda: CT_munda.text,
      cBCHAmatako: CB_CH_Amatako.text,
      activeStatus:"1",
      ubudoziID: myID,
    );
// may i test it ?ok
    try {
      var url = API.saveHejuruData;
      var response =
          await http.post(Uri.parse(url), body: hejuruModel.toJson());
      // print("Response status: ${response.statusCode}");
      // print("Response body: ${response.body}");
      //check if response is success
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        
        if (data['success'] == true) {
         // show dialog
          Get.defaultDialog(
            title: "Success",
            middleText: "Umwenda wawe winjijwe neza !",
            actions: [
              TextButton(
                onPressed: (){
                  // clear all text fields
                  clientNames.clear();
                  phoneNumber.clear();
                  EP_ibitugu.clear();
                  LP_igituza.clear();
                  LT_uburebure.clear();
                  LM_amaboko.clear();
                  CM_Igikonjo.clear();
                  CT_munda.clear();
                  CB_CH_Amatako.clear();
                  // close dialog
                  Get.back();

                },
                child: Text("Ok"),
              )
            ]
          );
          Get.to(()=>IbyakozweHejuruFragment());
        }else{
          print("no object");
      }
      } else {
        // show error message
        Get.snackbar("Error from response", " kubika byanze");
      }
    } catch (e) {
      // show error message
      Get.snackbar(
          "Error from catch", "$e");
          print("Error from catch to save $e");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          title: "Andika Umwenda Wo Hejuru",  
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            // add image to body
            Center(
              // set icon color
              child: Image.asset('assets/sewing.png',
                  color: const Color.fromARGB(255, 43, 44, 143),
                  height: 80,
                  width: 100),
            ),
            const Text(
              "Kwandika Umwenda Wo Hejuru \n",
            ),
            const Text(
              "Ishati / Ikote",
              style: TextStyle(fontSize: 20.0),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: clientNames,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Amazina y\'umuclient',
                                  border: OutlineInputBorder(),
                                  prefixIcon: const Icon(
                                    Icons.text_fields,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: phoneNumber,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  labelText: 'Nimero ya Telephone',
                                  border: OutlineInputBorder(),
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: EP_ibitugu,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'E.P / Ibitugu',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: LP_igituza,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'L.P / Igituza',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ]),

                              const SizedBox(
                                height: 8.0,
                              ),

                              // second row
                              Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: LT_uburebure,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'L.T Uburebure Bwose',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: LM_amaboko,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'L.M amaboko',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ]),

                              const SizedBox(
                                height: 8.0,
                              ),
                              // second row
                              Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: CM_Igikonjo,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'C.M cy Igikonjo',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: CT_munda,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'C.T cy Munda',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ]),

                              const SizedBox(
                                height: 8.0,
                              ),
                              // second row
                              Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: CB_CH_Amatako,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'C.B/C.H Amatako',
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: // add button to body
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 43, 44, 143),
                                  onPrimary: Colors.white,
                                ),
                                    onPressed: () {
                                      // check if the form is valid if not show error
                                      if (formKey.currentState!.validate()) {
                                        // check if TextEditingControllers are empty
                                        if (clientNames.text.isEmpty ||
                                            phoneNumber.text.isEmpty ||
                                            EP_ibitugu.text.isEmpty ||
                                            LP_igituza.text.isEmpty ||
                                            LT_uburebure.text.isEmpty ||
                                            LM_amaboko.text.isEmpty ||
                                            CM_Igikonjo.text.isEmpty ||
                                            CT_munda.text.isEmpty ||
                                            CB_CH_Amatako.text.isEmpty) {
                                          // show error if TextEditingControllers are empty
                                          Get.snackbar(
                                              "IKOSA!",
                                              "Mubaze mwuzuze amakuru yose asabwa!",
                                              snackPosition:
                                                  SnackPosition.TOP,
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white);
                                        } else {
                                          // call the method to save data to database
                                        KubikaHejuru();
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Bika',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                        // =====
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
