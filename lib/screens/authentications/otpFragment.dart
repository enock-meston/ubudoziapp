import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../API_Connection/api_connection.dart';
import 'new_password.dart';

class OTPFragment extends StatefulWidget {
  const OTPFragment(String phone, {super.key});

  @override
  State<OTPFragment> createState() => _OTPFragmentState();
}

class _OTPFragmentState extends State<OTPFragment> {
  var isObsecure = true.obs;
  // form key declaration
  var formKey = GlobalKey<FormState>();

//get value from textfield
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController value3 = TextEditingController();
  TextEditingController value4 = TextEditingController();

  // send otp to server
  sendOtptoServer() async{
    // get value from textfield
    var otp = value1.text + value2.text + value3.text + value4.text;
    var url = API.verifyOtp;
    var response = await http.post(Uri.parse(url), body: {
      "otp": otp,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String status = data['status'];
      String message = data['message'];
      // get phone number
      String phone1 = data['phoneNumber'];
      
      // check if status is success
      if (status == "success") {
        // show snackbar
        Get.snackbar(
          "Success",
          message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // navigate to new password screen
        Get.to(NewPassword(phone1));
      } else {
        // show snackbar
        Get.snackbar(
          "Failed",
          message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      
    }else{
      Get.snackbar(
        "Failed",
        "Ijambo banga ntibaho",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              // image logo here
              Image.asset(
                "assets/sewing.png",
                height: 200,
                width: 300,
                //  padding Image to top
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 43, 44, 143),
              ),
              const Text(
                "Andika Code / OTP !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: value1,
                          onSaved: (value1){},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      // divider
                      const SizedBox(
                        width: 10,
                      ),

                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: value2,
                          onSaved: (value2){},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      // divider
                      const SizedBox(
                        width: 10,
                      ),

                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: value3,
                          onSaved: (value3){},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
// divider
                      const SizedBox(
                        width: 10,
                      ),

                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: value4,
                          onSaved: (value4){},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              // button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // form validation
                    if (formKey.currentState!.validate()) {
                      // save form
                      formKey.currentState!.save();
                      // Get.to(const IbyakozweHasi());
                      
                      // check if all fields are not empty
                      if (value1.text.isNotEmpty ||
                          value2.text.isNotEmpty ||
                          value3.text.isNotEmpty ||
                          value4.text.isNotEmpty) {
                        sendOtptoServer();
                      }else{
                        Get.snackbar(
                          "Failed",
                          "Uzuza code / OTP",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    }
                  },
                  child: const Text("Ohereza"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 43, 44, 143),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
