import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ubudoziapp/API_Connection/api_connection.dart';

import 'otpFragment.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var isObsecure = true.obs;
  // form key declaration
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  Future sendOtpToServer() async {
    // get value from textfield
    var phone = phoneController.text;
    //check if phoneNumber is in the database
    String url = API.phoneVerification;
    var response = await http.post(Uri.parse(url), body: {
      "phone": phone,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      String status = data['status'];
      String message = data['message'];
      // check if status is success
      if (status == "success") {
        // set 4 digit otp code by random
        var otp = Random().nextInt(9999 - 1000) + 1000;
        // cast otp to string
        String otpString = otp.toString();
        //  send otp to server by using saveOtp function
        saveOtp(phone, otpString);
        // show snackbar
        Get.snackbar(
          "Success $otpString",
          message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
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
    } else {
      print(response.body);
    }
  }

  // save otp to server
  saveOtp(phone, otpString) async {
    String url = API.saveOtp;
    var response = await http.post(Uri.parse(url), body: {
      "phone": phone,
      "otp": otpString,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String status = data['status'];
      String message = data['message'];
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
        Get.to(OTPFragment(phone));
        // sendMessage 
        sendMessage(phone, otpString);
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
    }
  }

  sendMessage(phone, otpString) async{
        // send sms to phone 
      // ==========
      //  go to the next line to get the api key
    


      String message = "Your OTP is: $otpString";
  var data = {
    "sender": 'Nigoote ltd',
    "recipients": "$phone",
    "message": "$message",
  };

  var url = Uri.parse("https://www.intouchsms.co.rw/api/sendsms/.json");
  var username = "enock-meston";
  var password = "Enock@123";

  var response = await http.post(url,
      headers: <String, String>{
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('$username:$password')),
      },
      body: data);
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
                "Niba wibagiwe Ijambo banga !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // phone
                      // TextFormField here
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Nimero ya telephone",
                          hintText: "Andika nimero ya telephone",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.phone),
                          suffixIcon: Icon(Icons.close),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Telephone ntago igomba kubura";
                          } else if (value.length < 10) {
                            return "Telephone y'umuntu irimo amakarita 10";
                          }
                          // else if (!value.contains("@")) {
                          //   return "Invalid email";
                          // }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // login button
                      // ElevatedButton here
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Get.to(OTPFragment());
                            sendOtpToServer();
                          }
                        },
                        child: Text("Ohereza"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 43, 44, 143),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
