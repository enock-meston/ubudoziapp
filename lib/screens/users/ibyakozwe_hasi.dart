import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_profile_controler.dart';


class IbyakozweHasiFragment extends StatefulWidget {
  const IbyakozweHasiFragment({super.key});

  @override
  State<IbyakozweHasiFragment> createState() => _IbyakozweHasiFragmentState();

}

class _IbyakozweHasiFragmentState extends State<IbyakozweHasiFragment> {
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ibyakozwe Fragment"),
      )
      
    );
  }
}