import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/widgets/app_bar.dart';

import '../../controller/user_profile_controler.dart';
import '../authentications/loginFragment.dart';

class UmwirondoroFragment extends StatelessWidget {
  // create instance of user profile controller
  final UserProfileControler _userProfileControler =
      Get.put(UserProfileControler());

  //logout
  signOutUser() async {
    var resultResponce = await Get.dialog(
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
    if (resultResponce == "loggedOut") {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove("userId");
      Get.offAll(LoginFragment());
      //  delete or remove user data from phone local storage
      // RememberUserPrefs.removeUserInfo().then((value) {
      //   Get.offAll(Login_Screen());
      // });
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
    // _userProfileControler
    _userProfileControler.getUserProfile();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Umwirondoro",
      ),

      // make card profile
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: Image.asset("assets/sewing.png").image,
                  backgroundColor: const Color.fromARGB(255, 43, 44, 143),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //  user Obx and isLoading to check if data is loading or not
              Obx(
                () => _userProfileControler.isLoading.value
                    ? const CircularProgressIndicator()
                    : userInfoItemProfile(Icons.person,
                        _userProfileControler.userProfileModel.lname ?? ""),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => _userProfileControler.isLoading.value
                    ? const CircularProgressIndicator()
                    : userInfoItemProfile(Icons.person,
                        _userProfileControler.userProfileModel.lname ?? ""),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => _userProfileControler.isLoading.value
                    ? const CircularProgressIndicator()
                    : userInfoItemProfile(
                        Icons.phone,
                        _userProfileControler.userProfileModel.phoneNumber ??
                            ""),
              ),
              const SizedBox(
                height: 10,
              ),
              // divider
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              // payment button wtith icon
              ElevatedButton.icon(
                onPressed: () {
                  //check if i have paid or not with dialog
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
                            "No",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
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
                },
                icon: const Icon(Icons.payment),
                label: const Text("Ubu Umusanzu wawe ni Ubuntu"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 2, 97, 23),
                  ), // Set your desired background color
                ),
              ),

              // change password button
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.lock),
                label: const Text("Change Password"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 138, 154, 167),
                  ), // Set your desired background color
                ),
              ),

              // logout button
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
                  ), // Set your desired background color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
