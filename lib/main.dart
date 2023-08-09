import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/screens/authentications/loginFragment.dart';
import 'package:ubudoziapp/screens/splash.dart';
import 'package:ubudoziapp/screens/users/mainFragment.dart';

import 'UserPreferences/user_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: FutureBuilder(
      future: RememberUserPrefs.readUserInfo(),
      builder: (context, snapshot) {
        snapshot.hasData == false
            ? print("data is null")
            : print("data is not null ${snapshot.hasData}");

        if (snapshot.hasData == false) {
          return LoginFragment();
        } else {
          return UserHome();
        }
      },
    ),
  ));
}


