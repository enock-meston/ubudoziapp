import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/controller/hasi_controller.dart';

import '../../controller/user_profile_controler.dart';
import '../../widgets/app_bar.dart';

class IbyakozweHasiFragment extends StatefulWidget {
  const IbyakozweHasiFragment({super.key});

  @override
  State<IbyakozweHasiFragment> createState() => _IbyakozweHasiFragmentState();
}

class _IbyakozweHasiFragmentState extends State<IbyakozweHasiFragment> {
  final UserProfileControler userProfileControler =
      Get.put(UserProfileControler());

  HasiController hasiController = Get.put(HasiController());

  @override
  void initState() {
    hasiController.getHasiData();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(
            title: 'Ibyakozwe Hasi',
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: hasiController.hasiDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        "${hasiController.hasiDataList[index].clientNames}"),
                    subtitle: Text(
                        "${hasiController.hasiDataList[index].CTMunda}"),
                    trailing:
                        Text("${hasiController.hasiDataList[index].CCIbibero}"),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
