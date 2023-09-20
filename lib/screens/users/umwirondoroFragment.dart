import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ubudoziapp/widgets/app_bar.dart';
import 'dart:convert';

import '../../UserPreferences/user_preferences.dart';
import '../../controller/user_profile_controler.dart';
import '../../payment/subscription.dart';
import '../authentications/change_password.dart';
import '../authentications/loginFragment.dart';

class UmwirondoroFragment extends StatelessWidget {
  final UserProfileControler _userProfileControler =
      Get.put(UserProfileControler());

  Future<void> signOutUser() async {
    var resultResponse = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "Logout",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "Are you Sure?\nYou Want to logout from app?",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedOut");
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
    if (resultResponse == "loggedOut") {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove("userId");
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.offAll(LoginFragment());
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:  "Umwirondoro",
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Subscription());
            },
            icon: const Icon(
              Icons.payments,
              color: Color.fromARGB(255, 43, 44, 143),
            ),
          ),
          //help icon
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  backgroundColor: Colors.grey,
                  title: const Text(
                    "Ubufasha",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: const Text(
                    "Contact us on:\n+250 783 982 872\n+250 723 993 376",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.help,
              color: Color.fromARGB(255, 43, 44, 143),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _userProfileControler.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: const Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    userInfoItemProfile(Icons.person,
                        _userProfileControler.userProfileModel.lname ?? ""),
                        const SizedBox(height: 10),
                    userInfoItemProfile(Icons.person_2, "${_userProfileControler.userProfileModel.fname?? ""}"),
                    const SizedBox(height: 10),
                    userInfoItemProfile(
                        Icons.phone,
                        _userProfileControler.userProfileModel.phoneNumber ??
                            ""),
                    const SizedBox(height: 10),
                    const Divider(thickness: 2),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            backgroundColor: Colors.grey,
                            title: const Text(
                              "Payment",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text(
                              "Kwishyura umusanze wawe ni 00 Rwf",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "OK",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.payment),
                      label: const Text("Ubu Umusanzu wawe ni Ubuntu"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 2, 97, 23),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigte to change password screen
                        // Get.to(ChangePasswordScreen());
                      },
                      icon: const Icon(Icons.lock),
                      label: const Text("Change Password"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 138, 154, 167),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        signOutUser();
                      },
                      icon: const Icon(
                        Icons.logout,
                      ),
                      label: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 138, 154, 167),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
