import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubudoziapp/payment/pay_subscription.dart';
import 'package:ubudoziapp/widgets/app_bar.dart';

import '../controller/subscription_controller.dart';

class Subscription extends StatelessWidget {
  Subscription({super.key});
  SubScriptionController subScriptionController =
      Get.put(SubScriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Subscription",
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<void>(
            future: subScriptionController.getSubscription(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return ListView.builder(
                  itemCount: subScriptionController.subscriptionDataList.length,
                  itemBuilder: (context, index) {
                    var subscription =
                        subScriptionController.subscriptionDataList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PaySubscription(
                          PayData: subscription));
                      },
                      child: Card(
                        color: Colors.indigo[50],
                        child: ListTile(
                          title: Text(subscription.title ?? ""),
                          subtitle: Text("${subscription.amount} RWF"),
                          trailing:
                              Text("Per ${subscription.duration ?? ""} Months"),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
