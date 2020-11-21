import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';

class HealthTest extends StatefulWidget {
  @override
  _HealthTestState createState() => _HealthTestState();
}

class _HealthTestState extends State<HealthTest> {
  retItems() {
    switch (i) {
      case 0:
        return ans0;

        break;
      case 1:
        return ans1;

        break;
      case 2:
        return ans2;

        break;
      case 3:
        return 3;

        break;
      case 4:
        return ans4;

        break;
      default:
        return ans0;
    }
  }

  int i = 0, _val = 1;
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
                "Q${i + 1}" + " " + ques[i],
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton(
                value: _val,
                items: [
                  DropdownMenuItem(
                    child: Text("Terrible"),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("I am Fed up!"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Antisocial"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Happy"),
                    value: 3,
                  ),
                ],
                onChanged: (value) {
                  _val = value;
                  setState(() {});
                }),
            SizedBox(height: 10),
            
          ],
        )),
      ),
    );
  }
}
