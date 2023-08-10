import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Subscription  extends StatefulWidget {
   Subscription ({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
String selectedPlan = '';

  List<Map<String, dynamic>> subscriptionPlans = [
    {
      'title': 'Basic Plan',
      'price': '600 Rwf/month',
    },
    {
      'title': 'Premium Plan',
      'price': '1150 Rwf/ 2 months',
    },
    {
      'title': 'Ultimate Plan',
      'price': '2000 Rwf / 3 months',
    },
  ];

  Widget buildSubscriptionCard(Map<String, dynamic> plan) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = plan['title'];
        });
      },
      child: Card(
        color: selectedPlan == plan['title'] ? Colors.blue : null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                plan['price'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Plans'),
      ),
      body: ListView.builder(
        itemCount: subscriptionPlans.length,
        itemBuilder: (context, index) {
          return buildSubscriptionCard(subscriptionPlans[index]);
        },
      ),
    );
  }
}