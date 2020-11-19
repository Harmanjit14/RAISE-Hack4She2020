import 'package:RAISE/Profilepage.dart';
import 'package:RAISE/WorkPage.dart';
import 'package:RAISE/awareness.dart';
import 'package:RAISE/colorFile.dart';
import 'package:RAISE/health.dart';
import 'package:RAISE/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> with ColorFile {
  var _selectedTab = _SelectedTab.home;
  int index = 0;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      setState(() {
        index = i;
      });
    });
  }

  Widget navbar() {
    switch (index) {
      case 0:
        {
          return HomeWid();
        }
        break;
      case 1:
        {
          return HealthPage();
        }
        break;
      case 2:
        {
          return AwarePage();
        }
        break;
      case 3:
        {
          return WorkPage();
        }
        break;
      case 4:
        {
          return ProfilePage();
        }
        break;
      default:
        {
          return HomeWid();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FloatingActionButton(
          backgroundColor: deepBrown,
          child: Icon(Icons.notification_important),
          onPressed: () {
            Alert(
              context: context,
              type: AlertType.warning,
              title: "Emmergency Alert!",
              desc: "This will alert Police Services that you need help!",
              buttons: [
                DialogButton(
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  color: Color.fromRGBO(0, 179, 134, 1.0),
                ),
              ],
            ).show();
          }),
      body: SafeArea(
        child: navbar(),
      ),
      bottomNavigationBar: Container(
        //height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SalomonBottomBar(
              currentIndex: _SelectedTab.values.indexOf(_selectedTab),
              onTap: _handleIndexChanged,
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(FontAwesomeIcons.home),
                  title: Text("Home"),
                  selectedColor: Colors.blue[700],
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.local_hospital_rounded),
                  title: Text("Health"),
                  selectedColor: Colors.pink,
                ),
                SalomonBottomBarItem(
                  icon: Icon(FontAwesomeIcons.handsHelping),
                  title: Text("Self Help"),
                  selectedColor: Colors.deepPurple,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.home_repair_service_rounded),
                  title: Text("Work"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, health, aware, work, profile }
