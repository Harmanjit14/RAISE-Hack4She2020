import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<Widget> boxes;
  int x = 0;
  var titleN;
  var descN;
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
        Container(
          height: 500,
          child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext ctxt, int index) {
                var temp = jobs[index];
                titleN = temp["title"];
                descN = temp["description"];
                var loc = temp["location"];
                var mob = temp["mobile"];
                var skills = temp["skillsrequired"];
                var pay = temp["pay"];
                print(index);
                print(titleN + " " + descN);
                index++;
                return box(
                  titleN,
                  descN,
                  loc,
                  mob,
                  skills,
                  pay,
                );
              }),
        ),
      ]);
    }
  }
}

Widget box(String title, String descr, String loc, String mob, String skills,
    int pay) {
  return Container(
    child: Column(children: [
      Text(title),
      Text(descr),
      // Text(pay.toString()),
      // Text(skills),
      // Text(mob),
      // Text(loc),
      SizedBox(height: 10),
    ]),
  );
}
