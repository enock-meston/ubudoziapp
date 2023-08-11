import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import getx
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubudoziapp/screens/users/umwirondoroFragment.dart';

import '../controller/user_profile_controler.dart';
import 'authentications/loginFragment.dart';
import 'users/mainFragment.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 3), () {
      if (prefs.getString('userId') != null) {
        Get.offAll(() => UserHome());
      } else {
        Get.offAll(() => LoginFragment());
      }
  
    });
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
                    color : const Color.fromARGB(255, 43, 44, 143),),
                nextScreen: UserHome(),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.white)),
      ),
    );
  }
}
