import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Welcome to your Dashboard',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
