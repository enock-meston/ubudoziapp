import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/screens/users/ahabanzaFragment.dart';
import 'package:ubudoziapp/screens/users/hasiFragment.dart';
import 'package:ubudoziapp/screens/users/hejuruFragment.dart';
import 'package:ubudoziapp/screens/users/ibyakozwe_hasi.dart';
import 'package:ubudoziapp/screens/users/ibyakozwe_hejuru.dart';
import 'package:ubudoziapp/screens/users/umwirondoroFragment.dart';

import '../../controller/hasi_controller.dart';
import '../../controller/hejuru_controller.dart';
import '../../controller/user_profile_controler.dart';
import 'main2Fragment.dart';

class UserHome extends StatefulWidget {
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());
  HejuruController hejuruController = Get.put(HejuruController());
  HasiController hasiController = Get.put(HasiController());

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int currentIndex = 0;

  final screens = [
    Main2Fragment(),
    UmwirondoroFragment(),
  ];

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 43, 44, 143),
        selectedItemColor: const Color.fromARGB(255, 158, 155, 155),
        unselectedItemColor: Colors.white,
        iconSize: 30,
        onTap: (index) {
          // Set the selected index and animate to the corresponding page
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/sewing.png', // Replace with your image asset path
              width: 30.0,
              height: 30.0,
              color: const Color.fromARGB(255, 158, 155, 155),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setingi",
          ),
        ],
      ),
    );
  }
}
