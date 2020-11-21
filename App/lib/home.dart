import 'dart:ui';
import 'package:RAISE/colorFile.dart';
import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeWid extends StatefulWidget {
  @override
  _HomeWidState createState() => _HomeWidState();
}

class _HomeWidState extends State<HomeWid> with ColorFile {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget genderChild() {
    // pString = "Start Tracking";
    if (gender == "F") {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Period Tracker!",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: Text(
                    "click the button to start tracker",
                    style:
                        GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: OutlineButton(
                    splashColor: lightPink,
                    highlightedBorderColor: Colors.pink[700],
                    borderSide: BorderSide(color: Colors.pink[700], width: 2),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Add to my Calendar",
                        desc:
                            "Use this feature when you are on your periods so that it can track them more efficiently ",
                        buttons: [
                          DialogButton(
                            highlightColor: deepPink,
                            child: Text(
                              pString,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () async {
                              await addPeriodInfo();
                              await getPeriodInfo();
                              pString = "Done!";
                              setState(() {});
                              Navigator.pop(context);
                            },
                            color: deepPink,
                          ),
                        ],
                      ).show();
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.pink[700],
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  height: 150,
                  child: Image.asset(
                    "lib/assets/period.gif",
                    fit: BoxFit.fill,
                  )),
            ),
          ],
        ),
      );
    } else
      return SizedBox(
        height: 0,
        width: double.maxFinite,
      );
  }

  Widget periodChild() {
    if (gender == "F") {
      return RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            text: "Period Tracker : ",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            children: [
              TextSpan(
                text: selcPeriod,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: activeColorP)),
              )
            ]),
      );
    } else {
      return SizedBox(
        height: 0,
        width: double.maxFinite,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 7),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$name",
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TableCalendar(
                  locale: "en_US",
                  onDaySelected: (day, events, holidays) {
                    if (holidays.isEmpty) {
                      activeColor = Colors.red;
                      selcExercise = "You were Inactive this Day!";
                      if (events.isEmpty) {
                        activeColorP = Colors.black;
                        selcPeriod = "Period's are'nt Expected!";
                      } else {
                        var x = DateTime.now();
                        var y = day.compareTo(x);
                        // print(y);
                        if (y < 0) {
                          activeColorP = deepPink;
                          selcPeriod = "You had Periods this Day";
                        } else {
                          activeColorP = deepPink;
                          selcPeriod = "Periods are expected this Day";
                        }
                      }
                    } else {
                      activeColor = Colors.green;
                      selcExercise = "You were Active this Day!";
                      if (events.isEmpty) {
                        activeColorP = Colors.black;
                        selcPeriod = "Period's are'nt Expected!";
                      } else {
                        var x = DateTime.now();
                        var y = day.compareTo(x);
                        // print(y);
                        if (y < 0) {
                          activeColorP = deepPink;
                          selcPeriod = "You had Periods this Day";
                        } else {
                          activeColorP = deepPink;
                          selcPeriod = "Periods are expected";
                        }
                      }
                    }
                    setState(() {});
                  },
                  events: periodDays,
                  holidays: exerciseDays,
                  calendarController: _calendarController,
                  calendarStyle: CalendarStyle(
                    holidayStyle:
                        TextStyle(color: Colors.green[700], fontSize: 20),
                    weekendStyle: TextStyle(color: Colors.black),
                    selectedColor: Colors.blue[900],
                    todayColor: Colors.blue,
                    markersColor: deepPink,
                    outsideDaysVisible: false,
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: "Activity : ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      children: [
                        TextSpan(
                          text: selcExercise,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: activeColor)),
                        )
                      ]),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: periodChild(),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        child: Image.asset("lib/assets/exercise.gif"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fitness",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "click the button to start tracker",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Container(
                          width: 200,
                          alignment: Alignment.center,
                          child: OutlineButton(
                            splashColor: Colors.blueAccent[200],
                            highlightedBorderColor: Colors.blue[700],
                            borderSide:
                                BorderSide(color: Colors.blue[700], width: 2),
                            onPressed: () {
                              Navigator.pushNamed(context, '/fit');
                              // getProfile();
                            },
                            child: Text(
                              "Explore",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              genderChild(),
            ],
          ),
        ),
      ),
    );
  }
}
