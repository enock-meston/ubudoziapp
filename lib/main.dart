import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

