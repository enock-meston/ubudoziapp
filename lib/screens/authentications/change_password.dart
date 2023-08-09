import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../controller/user_profile_controler.dart';
import '../../widgets/app_bar.dart';

class ChangePassord extends StatefulWidget {
   ChangePassord({super.key});

  @override
  State<ChangePassord> createState() => _ChangePassordState();
}

class _ChangePassordState extends State<ChangePassord> {
  // create instance of user profile controller
  final UserProfileControler _userProfileControler =
      Get.put(UserProfileControler());

  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Hindura Ijambo Banga",
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Hindura Ijambo Banga"),
            Center(
              child: Form(
                child: 
                // obs form
                Column(
                  children: [
                    Obx(() {
                        return TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Ijambo Banga Ryawe",
                        hintText: "Injiza Ijambo Banga Ryawe",
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                isObsecure.value = !isObsecure.value;
                              },
                              icon: Icon(Icons.remove_red_eye),
                            ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ijambo ry'ibanga ntago rigomba kubura";
                        } else if (value.length < 6) {
                          return "Ijambo ry'ibanga rigomba kuba rifite inyuguti 6 kuzamura";
                        } else {
                          return null;
                        }
                      },
                    );


                    }
                    ), 
                  ],
                ),
               

                ),
                ),
            
          ],
        ),
      ),
    );
  }
}
