import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/API_Connection/api_connection.dart';
import 'package:ubudoziapp/model/hasi_model.dart';

import '../../controller/user_profile_controler.dart';
import 'package:http/http.dart' as http;

import '../../widgets/app_bar.dart';

class HasiFragment extends StatelessWidget {
  // const HasiFragment({super.key});

// user profile controller
  final UserProfileControler _userProfileControler =
      Get.put(UserProfileControler());

      

//`clientNames`, `phoneNumber`, `CT_munda`, `LP_mumatako`,
// `CC_ibibero`, `LT_uburebure`, `CJ_mumavi`, `TB_mukirenge`, `updatedOn`,
// `activeStatus`, `umudozi_ID`
//

  // form key declaration
  var formKey = GlobalKey<FormState>();

  // text editing controller
  var clientNamesController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var CTMundaController = TextEditingController();
  var LPMumatakoController = TextEditingController();
  var CCIbiberoController = TextEditingController();
  var LTUburebureController = TextEditingController();
  var CJMumaviController = TextEditingController();
  var TBMukirengeController = TextEditingController();

  void kubikaHasi() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String myID = sharedPreferences.getString("userId").toString();

//use model to assign values
    HasiModel hasiModel = HasiModel(
      id: "",
      clientNames: clientNamesController.text,
      phoneNumber: phoneNumberController.text,
      cTMunda: CTMundaController.text,
      lPMumatako: LPMumatakoController.text,
      cCIbibero: CCIbiberoController.text,
      lTUburebure: LTUburebureController.text,
      cJMumavi: CJMumaviController.text,
      tBMukirenge: TBMukirengeController.text,
      updatedOn: "",
      activeStatus: "",
      umudoziID: myID,

    );

    try {
      var url = API.saveHasiData;
      var response = await http.post(Uri.parse(url), body: hasiModel.toJson());
      print("response.body hasi: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['status'] == "success") {
          print("success");
          // show dialog
          Get.defaultDialog(
            title: "Success",
            middleText: "Umwenda wanyu wabitswe neza!",
            backgroundColor: Colors.white,
            radius: 10,
            actions: [
              TextButton(
                onPressed: () {
                  // clear text editing controller
                  clientNamesController.clear();
                  phoneNumberController.clear();
                  CTMundaController.clear();
                  LPMumatakoController.clear();
                  CCIbiberoController.clear();
                  LTUburebureController.clear();
                  CJMumaviController.clear();
                  TBMukirengeController.clear();
                  // close dialog
                  Get.back();
                },
                child: const Text("OK"),
              ),
            ],
          );
        } else if (data['status'] == "error") {
          Get.snackbar("Error", "Umwenda w'umukiriya wanyu ntawabitswe neza!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        } else {
          print("error else ${response.statusCode}");
          Get.snackbar("Error", "Sisiteme ifite ikibazo!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      } else {
        print("error from else2 ${response.statusCode}");
      }
    } catch (e) {
      print("error from catch $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kwandika Umwenda Wo Hasi",
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // add image to body
            Center(
              // set icon color
              child: Image.asset(
                'assets/sewing.png',
                color: const Color.fromARGB(255, 43, 44, 143),
                  height: 80,
                  width: 100,
              ),
            ),
            const Text(
              "Kwandika Umwenda Wo Hasi \n",
            ),
            const Text(
              "IPANTARO/IKABUTURA",
              style: TextStyle(fontSize: 20.0),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("   "),
                          TextFormField(
                            controller: clientNamesController,
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
                            controller: phoneNumberController,
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
                                controller: CTMundaController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'C.T / Munda',
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
                                controller: LPMumatakoController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'L.P / Mumatako',
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
                                controller: CCIbiberoController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'C.C /Ibibero',
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
                                controller: LTUburebureController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'L.T/Uburebure',
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
                                controller: CJMumaviController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'C.J/ Mumavi',
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
                                controller: TBMukirengeController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'T.B/ Mukirenge',
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
                              child: // add button to body
                                  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromARGB(255, 43, 44, 143),
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {
                                  // check if the form is valid if not show error
                                  if (formKey.currentState!.validate()) {
                                   // check if TextEditingControllers are empty
                                    if (clientNamesController.text.isEmpty ||
                                        phoneNumberController.text.isEmpty ||
                                        CTMundaController.text.isEmpty ||
                                        LPMumatakoController.text.isEmpty ||
                                        CCIbiberoController.text.isEmpty ||
                                        LTUburebureController.text.isEmpty ||
                                        CJMumaviController.text.isEmpty ||
                                        TBMukirengeController.text.isEmpty) {
                                      Get.snackbar("IKOSA!",
                                          "Mubaze mwuzuze amakuru yose asabwa!",
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white);
                                    } else {
                                      // call function to send data to server
                                      kubikaHasi();
                                    }
                                    
                                  }
                                },
                                child: const Text('Bika'),
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                    //
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
