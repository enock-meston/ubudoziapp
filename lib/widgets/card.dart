// card 
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget implements PreferredSizeWidget {
  final String clientNames;
  final String clientPhoneNumber;
 

  const CustomCard({super.key, required this.clientNames, required this.clientPhoneNumber});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: [
          Text(clientNames, style: TextStyle(
            fontSize: 12,
          ),
          ),
          Text(clientPhoneNumber, style: TextStyle(
            fontSize: 12,
          ),
          ),
        ],
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
  
}