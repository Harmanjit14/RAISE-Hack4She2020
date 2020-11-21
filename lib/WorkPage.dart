import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  int x = 0;
  Future<int> getVals() async {
    x = await getJobs();
    print("done");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //  getVals();
    if (x == 0) {
      getVals();
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitChasingDots(
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Text(
              "Loading...",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
    } else {
      return Column(children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 15),
          alignment: Alignment.centerLeft,
          child: Text(
            "Available Jobs",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
        // ListView.builder(
        //     itemCount: jobs.length,
        //     itemBuilder: (BuildContext ctxt, int index) {
        //       return new Text(jobs[index]["name"]);
        //     })
      ]);
    }
  }
}
