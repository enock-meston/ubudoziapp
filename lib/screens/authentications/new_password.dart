import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../API_Connection/api_connection.dart';
import 'loginFragment.dart';

class NewPassword extends StatefulWidget {
  final String phone;
   NewPassword(this.phone, {super.key});
 

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
   var isObsecure = true.obs;
  // form key declaration
  var formKey = GlobalKey<FormState>();
  TextEditingController NewPasswordController = TextEditingController();
  TextEditingController phone = TextEditingController();
  

  changePassword() async {
    // get value from constructor to function in flutter
    // var phone = widget.phone;
    
    // get value from textfield
    
    var url = API.changePassword;
    var response = await http.post(Uri.parse(url), body: {
      "phone": phone.text,
      "password": NewPasswordController.text,
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
        // navigate to new password screen
        Get.to(LoginFragment());
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  "Andika Ijambo banga Rishya !",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.phone,
                  
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        
                      
                        // TextFormField here
                        
                        TextFormField(
                          controller: NewPasswordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Ijambobanga Rishya",
                            hintText: " Andika Ijambo banga Rishya",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.close),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ijambo banga ntibaho";
                            }else if (value.length < 6) {
                              return "Ijambo banga rirenga inyuguti 6";
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
                              changePassword();
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
      ),
    
    );
  }
  
  
}