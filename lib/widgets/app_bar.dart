import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget> actions;

  const CustomAppBar({
    required this.title,
    this.backgroundColor = Colors.blue,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title, style: TextStyle(
          color: Color.fromARGB(255, 43, 44, 143),
        ),),
        // icon
        backgroundColor: Color.fromARGB(255, 233, 233, 236),
        leading: Image(
          image: AssetImage("assets/sewing.png"),
          color: Color.fromARGB(255, 43, 44, 143),
        ),
      //  actions be null
        actions: actions.isEmpty ? null : actions,
        
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}