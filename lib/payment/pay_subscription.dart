import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:ubudoziapp/API_Connection/api_connection.dart';
import 'package:ubudoziapp/model/subscription_model.dart';
import 'package:ubudoziapp/widgets/app_bar.dart';
import 'package:http/http.dart' as http;

// import random
import 'dart:math';

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

          void paymentProcess() async {
            Get.defaultDialog(
              title: "Loading...",
              content: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue), // Set your desired color here
                backgroundColor: Colors.grey[200],
              ),
              barrierDismissible: false,
            );

            // payment API
            var timeOut = DateTime.now().second.toString();
            // random number from 10000 to 99999
            var randomOne =
                (100000 + Random().nextInt(999999 - 100000)).toString();
            var randomNumber =
                (10000 + Random().nextInt(99999 - 10000)).toString();

            String transactionID = "$randomOne$timeOut$randomNumber";
            print("seconds $timeOut phone : $phoneNumber amount : $amount");
            var headers = {'Content-Type': 'application/json'};
            var request = http.Request('POST',
                Uri.parse('https://opay-api.oltranz.com/opay/paymentrequest'));
            request.body = json.encode({
              "telephoneNumber": "25$phoneNumber",
              "amount": amount,
              "organizationId": "8c34791e-cbb7-4f51-b7a7-14ad3014ea7a",
              "description": "Payment for sewing of clothes services",
              "callbackUrl": "https://ubudozi.nigoote.com/android/callback.php",
              // "callbackUrl": "https://webhook.site/#!/1d06db09-0248-48eb-a1de-b570a724ce49",
              // "callbackUrl": "http://myonlineprints.com/payments/callback",
              "transactionId": "$transactionID"
            });
            request.headers.addAll(headers);

            http.StreamedResponse response = await request.send();

            if (response.statusCode == 200) {
              // print(await response.stream.bytesToString());
              var data = await response.stream.bytesToString();
              var jsonData = json.decode(data);
              print("=====================");
              print(data);
              print("========$jsonData=============");

              String code = jsonData['code'];
              String description = jsonData['description'];
              String status = jsonData['status'];

              if (code == "401") {
                Get.defaultDialog(
                  title: "Message",
                  middleText:
                      "THE PAYER DOES NOT HAVE SUFFICIENT FUNDS ON HIS/HER ACCOUNT",
                  confirm: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("OK"),
                  ),
                );
              }
              // Access values inside the 'body' object
              // String transactionID = jsonData['body']['transactionId'];

              // Print the values
              // print('Code: $code');
              // print('Description: $description');
              // print('Status: $status');
              // print('Transaction ID: $transactionId');
              print("=====================");
              //  ===================================
              // save to database using api
              String url = API.saveTransaction;
              print("urlPay: $url");
              print("d:  $User_Id ,$fname, $lname, $phoneNumber, $amount, $status ,$transactionID");
             
              var responseTransaction = await http.post(Uri.parse(url), body: {
                "umudozi_id": User_Id,
                "UmudoziNames": "$fname $lname",
                "phone": phoneNumber,
                "amount": amount,
                "status": status,
                "transactionId": transactionID,
              });

              if (responseTransaction.statusCode == 200) {
                var dataTransaction = jsonDecode(responseTransaction.body);
                print("turebe $dataTransaction");
                // print("transaction: ${dataTransaction}");
                var message = dataTransaction['message'];
                var status1 = dataTransaction['status'];
                if (status1 == "success" &&
                    message == "Transaction saved") {
                  Get.back();
                  // Show dialog
                  Get.defaultDialog(
                      title: "Message",
                      middleText: "Transaction added successfully",
                      confirm: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("OK"),
                      ));
                  // Get.back();
                } else {
                  print("errorsss");
                  Get.defaultDialog(
                      title: "Message",
                      middleText: "Transaction not added",
                      confirm: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("OK"),
                      ));
                }
              } else {
                print("error");
              }

              // ====================================
            } else {
              print(response.reasonPhrase);
            }
            // end of payment API

            // save transactions
            // close dialog
            Get.back();
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
                    child: Text("Ishyura"),
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
