import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_profile_controler.dart';
import '../splash.dart';
import 'hasiFragment.dart';
import 'hejuruFragment.dart';
import 'ibyakozwe_hasi.dart';
import 'ibyakozwe_hejuru.dart';
import 'umwirondoroFragment.dart';

class Main2Fragment extends StatefulWidget {

  UserProfileControler userProfileControler =
      Get.put(UserProfileControler());

  @override
  State<Main2Fragment> createState() => _Main2FragmentState();
}

class _Main2FragmentState extends State<Main2Fragment> {
  @override
  Widget build(BuildContext context) {
      String fn = "${userProfileControler.userProfileModel.fname ?? ""}";
    String firstCharacter = fn.isNotEmpty ? fn[0] : "";

     String ln = "${userProfileControler.userProfileModel.lname ?? ""}";
    String lastCharacter = ln.isNotEmpty ? ln[0] : "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 44, 143),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Text(firstCharacter +"."+ lastCharacter),
              onPressed: () {
                // Handle profile button press
                Get.to(UmwirondoroFragment());
              },
            ),
            Text(
              "Ahabanza" ,
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {
                // Handle notification button press
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${userProfileControler.userProfileModel.fname?? ""}  ${userProfileControler.userProfileModel.lname?? ""}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // line here
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add,
                size: 24,
                color: const Color.fromARGB(255, 43, 44, 143),
              ),
              SizedBox(width: 8), // Add space between the icon and text
              Text(
                'Kubika',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Button pressed action
                            Get.to(HasiFragment());
                          },
                          child: Image.asset(
                            'assets/pant_icon.png', // Replace with your image asset path
                            width: 50.0,
                            height: 50.0,
                            color:const Color.fromARGB(255, 43, 44, 143),
                          ),
                        ),
                        Text('Ipantalo/\nIkabutura'),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                  // button 2
                  SizedBox(height: 20),
                  Container(
                    child:Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Button pressed action
                            Get.to(HejuruFragment());
                          },
                          child: Image.asset(
                            'assets/suit.png', // Replace with your image asset path
                            width: 50.0,
                            height: 50.0,
                            color:const Color.fromARGB(255, 43, 44, 143),
                          ),
                        ),
                        Text('Ikote /\nIshati'),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child:Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Button pressed action
                          },
                          child: Image.asset(
                            'assets/skirt_icon.png', // Replace with your image asset path
                            width: 50.0,
                            height: 50.0,
                            color:const Color.fromARGB(255, 43, 44, 143),
                          ),
                        ),
                        Text('Ijipo\n'),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.remove_red_eye,
                size: 24,
                color: const Color.fromARGB(255, 43, 44, 143),
              ),
              SizedBox(width: 8), // Add space between the icon and text
              Text(
                'Kureba',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child:Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Button pressed action
                            Get.to(IbyakozweHasiFragment());
                          },
                          child: Image.asset(
                            'assets/pant_icon.png', // Replace with your image asset path
                            width: 50.0,
                            height: 50.0,
                            color:const Color.fromARGB(255, 43, 44, 143),
                          ),
                        ),
                        Text('Ipantalo /\nIkabutura'),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                  
                  // button 2
                  SizedBox(height: 20),
                Container(
                    child:Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Button pressed action
                            Get.to(IbyakozweHejuruFragment());
                          },
                          child: Image.asset(
                            'assets/suit.png', // Replace with your image asset path
                            width: 50.0,
                            height: 50.0,
                            color:const Color.fromARGB(255, 43, 44, 143),
                          ),
                        ),
                        Text('Ikote /\nIshati'),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child:Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Button pressed action
                          },
                          child: Image.asset(
                            'assets/skirt_icon.png', // Replace with your image asset path
                            width: 50.0,
                            height: 50.0,
                            color:const Color.fromARGB(255, 43, 44, 143),
                          ),
                        ),
                        Text('Ijipo\n'),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
          ],

          // other row
        ),
      ),
    );
  }
}
