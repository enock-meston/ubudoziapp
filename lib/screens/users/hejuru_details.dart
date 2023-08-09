import 'package:flutter/material.dart';
import 'package:ubudoziapp/model/hejutu_model.dart';
import 'package:ubudoziapp/widgets/app_bar.dart';
import '../../controller/hejuru_controller.dart';

class HejuruDataDetail extends StatelessWidget {
  final HejuruModel hejuruData;
  HejuruDataDetail({required this.hejuruData});
  HejuruController hejuruController = HejuruController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: hejuruData.clientNames ?? "",
        // back icon
        actions:[ IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Amazina: ${hejuruData.clientNames}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Nimero ya Telephone: ${hejuruData.phoneNumber}",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              Text(
                "Ibitugu/EP: ${hejuruData.ePIbitugu} | Igituza/LP: ${hejuruData.lPIgituza} | Uburebure/LT: ${hejuruData.lTUburebure} | Amaboko/LM: ${hejuruData.lMAmaboko}",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                "Munda/CT: ${hejuruData.cTMunda} | Mumatako/CB-CH: ${hejuruData.cBCHAmatako} | Igikonjo/CM: ${hejuruData.cMIgikonjo}",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "Imiterere: ${hejuruData.activeStatus != "1" ? "Yarangiye" : "Ntirasozwa"}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: hejuruData.activeStatus != "1"
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // get data id
                      String dataId1 = "${hejuruData.id}";
                      String phoneNumber1 = "${hejuruData.phoneNumber}";
                      String clientNames1 = "${hejuruData.clientNames}";
                      print(" my name $clientNames1");
                      // ask for confirmation
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Kwemeza",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Mugiye Kwemeza ko mwasoje kudoda uyu Mwenda!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // close dialog
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Oya",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // close dialog
                                  Navigator.pop(context);
                                  // call function to update data
                                  hejuruController.kwemezaData(
                                      dataId1, phoneNumber1, clientNames1);
                                },
                                child: Text(
                                  "Yego",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Kwemeza"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 43, 44, 143),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // get data id
                      String dataId = "${hejuruData.id}";
                      // ask for confirmation
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Siba",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            content: Text(
                              "Murifuza Gusiba Burundu? ${hejuruData.clientNames}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Oya",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // call delete function
                                  hejuruController.deleteHejuruData(dataId);
                                },
                                child: Text(
                                  "Yego",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Siba"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
