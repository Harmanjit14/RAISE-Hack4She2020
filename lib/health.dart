import 'package:RAISE/colorFile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> with ColorFile {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Available Self-Tests",
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                  fontSize: 25),
            ),
          ),
        ]),
      ),
    );
  }
}
