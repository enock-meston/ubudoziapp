import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/screens/users/ahabanzaFragment.dart';
import 'package:ubudoziapp/screens/users/hasiFragment.dart';
import 'package:ubudoziapp/screens/users/hejuruFragment.dart';
import 'package:ubudoziapp/screens/users/ibyakozwe_hasi.dart';
import 'package:ubudoziapp/screens/users/ibyakozwe_hejuru.dart';
import 'package:ubudoziapp/screens/users/umwirondoroFragment.dart';

import '../../controller/user_profile_controler.dart';

class UserHome extends StatefulWidget {
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());
  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  // create instance of user profile controller
  
  
  int currentIndex = 0;

  final screens = [
    HejuruFragment(),
    HasiFragment(),
    IbyakozweHejuruFragment(),
    IbyakozweHasiFragment(),
    UmwirondoroFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // IndexedStack is used to make every screen be in live
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 43, 44, 143),
        selectedItemColor: const Color.fromARGB(255, 158, 155, 155),
        unselectedItemColor: Colors.white,
        iconSize: 30,
        // onTap: (index) {
        //   setState(() {
        //     currentIndex = index;
        //   });
        // }, or
        onTap: (index) => setState(() => currentIndex = index),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.upcoming),
            label: "Hejuru",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.downhill_skiing),
            label: "Hasi",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Ibyohejuru",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "IbyoHasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Umwirondoro",
          ),
        ],
      ),
    );
  }
}
