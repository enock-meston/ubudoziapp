import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/API_Connection/api_connection.dart';

import '../../model/user-model.dart';
import 'loginFragment.dart';
import 'package:http/http.dart' as http;

class RegistrationFragment extends StatefulWidget {
  @override
  State<RegistrationFragment> createState() => _RegistrationFragmentState();
}

class _RegistrationFragmentState extends State<RegistrationFragment> {

// form key declaration
  var formKey = GlobalKey<FormState>();
  //text field controllers
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;
  registerAndSaveUserRecord() async {
    // if (_formKey.currentState!.validate()) {
    //   print('Form is valid');
    // } else {
    //   print('Form is invalid');
    // }

    UserModel userModel = UserModel(
      fnameController.text.trim(),
      lnameController.text.trim(),
      phoneController.text.trim(),
      passwordController.text.trim(),
    );

    try {
      var url = API.signup;
      var res = await http.post(Uri.parse(url), body: userModel.toJson());
      print("hi hi${res.statusCode}");
      if (res.statusCode == 200) {
        //get response data
        var data = jsonDecode(res.body);
        // check if number is already registered
        // check status and message
        // get data from res.data
        var status = data['status'];
        var message = data['message'];

        if (message == "phone already registered" || status == "error") {
          Get.snackbar("Error", "Numero ya Telephone yarakoreshejwe",
              snackPosition: SnackPosition.TOP);
        } else {
          Get.snackbar("Success", "Konti Yafunguwe neza",
              snackPosition: SnackPosition.TOP);
          // Get.to(LoginFragment());
        }
        print(data);
        print(res);
      } else {
        print(res);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                color: Color.fromARGB(255, 43, 44, 143),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Fungura Konti",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
      
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // fnames
                    // TextFormField here
                    TextFormField(
                      controller: fnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Izina",
                        hintText: "Andika izina ryawe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.close),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Izina ntago igomba kubura";
                        }
                        // else if (!value.contains("@")) {
                        //   return "Invalid email";
                        // }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // fnames
                    // TextFormField here
                    TextFormField(
                      controller: lnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Izina Ry'umuryango",
                        hintText: "Andika Irindi izina ryawe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.close),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Irindi Izina ntago igomba kubura";
                        }
                        // else if (!value.contains("@")) {
                        //   return "Invalid email";
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
      
                    SizedBox(
                      height: 10,
                    ),
                    // password
                    // TextFormField here
                    Obx(() {
                      return TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObsecure.value,
                        decoration: InputDecoration(
                          labelText: "Ijambo ry'ibanga",
                          hintText: "Andika ijambo ry'ibanga",
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
                            return "Ijambo ry'ibanga ntago igomba kubura";
                          } else if (value.length < 6) {
                            return "Ijambo ry'ibanga ryiza cyane";
                          }
                          return null;
                        },
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    // confirm password
                    // TextFormField here
                    Obx(() {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObsecure.value,
                        decoration: InputDecoration(
                          labelText: "Emeza ijambo ry'ibanga",
                          hintText: "Emeza ijambo ry'ibanga",
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
                            return "Ijambo ry'ibanga ntago igomba kubura";
                          } else if (value.length < 6) {
                            return "Ijambo ry'ibanga ryiza cyane";
                          }
                          return null;
                        },
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    // sign up button
                    // ElevatedButton here
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Get.to(Home());
                          registerAndSaveUserRecord();
                        }
                      },
                      child: Text("Fungura Konti"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 43, 44, 143),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // sign in text
                    // Row here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ufite konti?"),
                        TextButton(
                          onPressed: () {
                            Get.to(LoginFragment());
                          },
                          child: Text("Injira"),
                        ),
                      ],
                    ),
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
    }
}
