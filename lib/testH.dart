import 'package:flutter/material.dart';

class HealthTest extends StatefulWidget {
  @override
  _HealthTestState createState() => _HealthTestState();
}

class _HealthTestState extends State<HealthTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Mental Health Test"),
        centerTitle: true,
      ),
    );
  }
}
