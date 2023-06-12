import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import getx
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentications/loginFragment.dart';
import 'users/mainFragment.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 3), () {});

    // here is where we can ckeck if user is logged in or not
    // if logged in then navigate to home screen
    // else navigate to login screen
    // go to login screen
    var user_id = prefs.getString("userId");
    
    //check if user is logged in
    if (user_id != null) {
      print("user_id: $user_id");
      // go to home screen
      Get.off(UserHome());
    } else {
      print("user_id 111: $user_id");
      // go to login screen
      Get.to(LoginFragment());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
            // add style to text
            child: AnimatedSplashScreen(
                duration: 4000,
                splash: Image.asset(
                    'assets/sewing.png',
                    width: 200,
                    height: 200,
                    color : const Color.fromRGBO(236, 82, 82, 1)),
                nextScreen: LoginFragment(),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.white)),
      ),
    );
  }
}
