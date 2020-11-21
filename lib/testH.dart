import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';

class HealthTest extends StatefulWidget {
  @override
  _HealthTestState createState() => _HealthTestState();
}

class _HealthTestState extends State<HealthTest> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mental Health Test"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Q${i+1}" + " " + ques[i],
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )),
      ),
    );
  }
}
