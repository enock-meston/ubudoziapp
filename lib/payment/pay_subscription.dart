import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:ubudoziapp/model/subscription_model.dart';
import 'package:ubudoziapp/widgets/app_bar.dart';

class PaySubscription extends StatelessWidget {
  final SubScriptionModel PayData;
  PaySubscription({required this.PayData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
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
          SharedPreferences prefs = snapshot.data!;
          String? phoneNumber = prefs.getString('phone');
          String? fname = prefs.getString('fname');
          String? lname = prefs.getString('lname');
          String? User_Id = prefs.getString('userId');

          // ====================Model Values===============
          String amount = PayData.amount ?? '';
          String subID = PayData.subId ?? '';
          
          TextEditingController _phoneNumberController =
              TextEditingController(text: phoneNumber ?? '');

          void paymentProcess() {
            // payment API

            // end of payment API

            // save transactions
          }

// ========================END OF FUNCTIONS=============================
          return Scaffold(
            appBar: CustomAppBar(
              title: PayData.title ?? "",
            ),
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      color: Colors.indigo[50],
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ubu Mugugiye Kwishyira amafaranga angana na ${PayData.amount} Rwf'
                            ' ku Ifatabuguzi/Plan/Subscription ryitwa: ${PayData.title}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Form(
                        child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Nimero ya telephone",
                            hintText: "Andika nimero ya telephone",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.phone),
                            suffixIcon: Icon(Icons.close),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Telephone ntago igomba kubura";
                            }
                            // else if (!value.contains("@")) {
                            //   return "Invalid email";
                            // }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      paymentProcess();
                    },
                    child: Text("Pay"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
