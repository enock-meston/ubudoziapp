import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/screens/authentications/loginFragment.dart';
import 'package:ubudoziapp/screens/splash.dart';
import 'package:ubudoziapp/screens/users/mainFragment.dart';

import 'UserPreferences/user_preferences.dart';
import 'screens/users/main2Fragment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
class CheckUserLoggedIn extends StatefulWidget {
  @override
  _CheckUserLoggedInState createState() => _CheckUserLoggedInState();
}

class _CheckUserLoggedInState extends State<CheckUserLoggedIn> {
  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckUserLoggedIn(),
    );
  }
}

Future<void> _checkUserLoggedIn() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");

  if (userId != null && userId.isNotEmpty) {
    print("my id is: $userId");
    Get.off(() => Main2Fragment());
    // Get.off(() => UserHome());
  } else {
    print("my id is null");
    Get.off(() => LoginFragment());
  }
}

