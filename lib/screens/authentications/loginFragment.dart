import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/payment/subscription.dart';
import 'package:ubudoziapp/screens/users/mainFragment.dart';

import '../../API_Connection/api_connection.dart';
import '../../model/user-model.dart';
import 'forgetPassword.dart';
import 'registrationFragment.dart';
import 'package:http/http.dart' as http;

class LoginFragment extends StatefulWidget {
  const LoginFragment({super.key});

  @override
  State<LoginFragment> createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  // form key declaration
  var formKey = GlobalKey<FormState>();
  //text field controllers
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  loginMethod() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // initialize phone and password
    var phoneTxt = phoneController.text;
    var passwordTxt = passwordController.text;
    // use try and catch to handle errors
    try {
      var url = Uri.parse(API.login);
      // send data to server
      var response = await http.post(url, body: {
        "phone": phoneTxt,
        "password": passwordTxt,
      });
      // print("response.body: ${response.body}");
      // check if response is successful
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // check status and message from data
        var status = data['status'];
        var message = data['message'];
        var payment_status = data['payment_status'];

        // print("status is: $status");
        // print("message is: $message");

        //check if status is true
        if (status == "success" &&
            message == "Login successful" &&
            payment_status == "paid") {
          // save data to sharedPref
          var user_id = preferences.setString("userId", data['id']);
          var payment_status =
              preferences.setString("payment_status", data['payment_status']);
          var fname = preferences.setString("fname", data['fname']);
          var lname = preferences.setString("lname", data['lname']);
          var phone = preferences.setString("phone", data['phoneNumber']);
          // =====
          // Get.offAll(MainFragment());
          Get.snackbar("Ubutumwa", "Kwinjira byagenze neza!",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white);
          Get.back();
          Get.offAll(() => UserHome());
          // =====
        } else if (status == "success" &&
            message == "Login successful" &&
            payment_status == "not_paid") {
          var user_id = preferences.setString("userId", data['id']);
          var payment_status =
              preferences.setString("payment_status", data['payment_status']);
          var fname = preferences.setString("fname", data['fname']);
          var lname = preferences.setString("lname", data['lname']);
          var phone = preferences.setString("phone", data['phoneNumber']);
          //default dialog
          Get.defaultDialog(
            title: "Ubutumwa",
            middleText:
                " Mukiriya mwiza, ${data['fname']} - ${data['lname']} \n\n"
                "Mushobora Gukomeza igikorwa cyo gukoresha iyi program aruko mumaze Kwishyura Ifatabuguzi(Plan/Subscription). \n\n"
                "Emeza gukomeza kugurango Wishyure!",
            textConfirm: "Komeza",
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
              Get.to(Subscription());
            },
            buttonColor: Colors.green,
            barrierDismissible: false,
          );
        } else if (status == "error" && message == "Password is incorrect") {
          Get.back();
          Get.snackbar("Ubutumwa", "Ijambo banga Siryo!",
              snackPosition: SnackPosition.TOP);
        } else if (status == "error" &&
            message == "Phone number does not exist") {
          Get.back();
          Get.snackbar("Ubutumwa", "Nimero ya Telephone Siyo!",
              snackPosition: SnackPosition.TOP);
        } else if (status == "success" &&
            message == "Login successful" &&
            payment_status == "expired") {
          var user_id = preferences.setString("userId", data['id']);
          var payment_status =
              preferences.setString("payment_status", data['payment_status']);
          var fname = preferences.setString("fname", data['fname']);
          var lname = preferences.setString("lname", data['lname']);
          var phone = preferences.setString("phone", data['phoneNumber']);
          //default dialog
          Get.defaultDialog(
            title: "Ubutumwa",
            middleText:
                " Mukiriya mwiza, ${data['fname']} - ${data['lname']} \n\n"
                "Ifatabuguzi ryawe Ryararangiye ,Mushobora Gukomeza igikorwa cyo gukoresha iyi program aruko "
                "mumaze Kwishyura Ifatabuguzi(Plan/Subscription). \n\n"
                "Emeza gukomeza kugurango Wishyure!",
            textConfirm: "Komeza",
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
              Get.to(Subscription());
            },
            buttonColor: Colors.green,
            barrierDismissible: false,
          );
        } else {
          Get.back();
          Get.snackbar("Ubutumwa", "System Ifite Ikibazo!",
              snackPosition: SnackPosition.TOP);
        }
      } else {
        print("Error from Response : ${response.body}");
      }
    } catch (e) {
      print("Error from Catch: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Kwinjira",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                      // password
                      // TextFormField here
                      Obx(() {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: isObsecure.value,
                          decoration: InputDecoration(
                            labelText: "Ijambo ry'ibanga",
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                isObsecure.value = !isObsecure.value;
                              },
                              icon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ijambo ry'ibanga ntago rigomba kubura";
                            } else if (value.length < 6) {
                              return "Ijambo ry'ibanga rigomba kuba rifite inyuguti 6 kuzamura";
                            }
                            return null;
                          },
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      // login button
                      // ElevatedButton here
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Validated");
                            loginMethod();
                            // loading dialog if login is processing
                            //loading dialog if login is processing
                            Get.defaultDialog(
                              title: "Kwinjira",
                              content: CircularProgressIndicator(),
                              barrierDismissible: false,
                            );
                          }
                        },
                        child: Text("Injira"),
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
                      // register text
                      // Row here
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Nta Konti mufite?"),
                          TextButton(
                            onPressed: () {
                              Get.to(RegistrationFragment());
                            },
                            child: Text(
                              "Yifungure",
                              style: TextStyle(
                                color: Color.fromARGB(255, 43, 44, 143),
                              ),
                            ),
                          ),
                          // forgot password text
                          // TextButton here

                          TextButton(
                            onPressed: () {
                              Get.to(ForgetPassword());
                            },
                            child: Text("Nibagiwe Ijambo banga"),
                          ),
                        ],
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
