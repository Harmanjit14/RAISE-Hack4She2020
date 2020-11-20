import 'dart:async';

import 'package:RAISE/colorFile.dart';
import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  "My Profile",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                child: Text(
                  "Name : " + name,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Age : " + age.toString(),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Gender : " + gender,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Height : " + height.toString(),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Weight : " + weight.toString(),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "BMI : " + bmi.toStringAsFixed(3),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  getbmiLog(),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: bmiCol,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Contact Details",
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Email : " + email,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Mobile : " + mobile,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Location Information",
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "City : " + city.toUpperCase(),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "State : " + state.toUpperCase(),
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30)),
                width: double.maxFinite,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlatButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.pushNamed(context, "/editProfile");
                    },
                    child: Text(
                      "Update Profile",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                width: double.maxFinite,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlatButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      token = "empty";
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with ColorFile {
  int stateButP = 0;
  Widget profChild() {
    switch (stateButP) {
      case 0:
        {
          return Text(
            "Update",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.checkCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Updated!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.timesCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Network Error",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "Upadte",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(),
          ),
        ),
        backgroundColor: white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Name : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempname = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: name,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Mobile : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempmobile = val;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: mobile,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "State : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempstate = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: state,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "City : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempcity = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: city,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Age : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempage = int.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: age.toString(),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Weight : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempweight = int.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: weight.toString() + " kg",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Height : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempheight = int.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: height.toString() + " cm",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton(
                      onPressed: () async {
                        stateButP = 1;
                        setState(() {});
                        int temp = await updateProfileFunction();
                        int temp2 = await getProfile();

                        if (temp == 1 && temp2 == 1) {
                          Timer(Duration(seconds: 2), () {
                            stateButP = 2;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 3), () {
                            bmiCal();
                            Navigator.pop(context);
                            setState(() {});
                          });
                        } else {
                          Timer(Duration(seconds: 2), () {
                            stateButP = 3;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 4), () {
                            stateButP = 0;
                            setState(() {});
                          });
                        }
                      },
                      color: Colors.teal,
                      textColor: white,
                      padding: EdgeInsets.all(10),
                      splashColor: lightPink,
                      child: profChild(),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}

class CreateMyProfile extends StatefulWidget {
  @override
  _CreateMyProfileState createState() => _CreateMyProfileState();
}

class _CreateMyProfileState extends State<CreateMyProfile> with ColorFile {
  int stateButP = 0;
  Widget profChild() {
    switch (stateButP) {
      case 0:
        {
          return Text(
            "Add Profile",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.checkCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Updated!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.timesCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Network Error",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "Upadte",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
    }
  }

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(),
          ),
        ),
        backgroundColor: white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Name : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempname = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: name,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Gender : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Male"),
                                value: 0,
                                onTap: () {
                                  tempgender = "M";
                                },
                              ),
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: 1,
                                onTap: () {
                                  tempgender = "F";
                                },
                              ),
                            ],
                            onChanged: (value) {
                              _value = value;
                              setState(() {});
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Mobile : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempmobile = val;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: mobile,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "State : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempstate = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: state,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "City : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempcity = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: city,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Age : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempage = int.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              // hintText: age.toString(),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Weight : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempweight = int.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: " kg",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        "Height : ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            tempheight = int.parse(val);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: " cm",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton(
                      onPressed: () async {
                        stateButP = 1;
                        setState(() {});

                        int temp2 = await getToken();
                        int temp = await updateProfileFunction();

                        if (temp == 1 && temp2 == 1) {
                          Timer(Duration(seconds: 2), () {
                            stateButP = 2;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 3), () {
                            bmiCal();
                            Navigator.pop(context);
                            setState(() {});
                          });
                        } else {
                          Timer(Duration(seconds: 2), () {
                            stateButP = 3;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 4), () {
                            stateButP = 0;
                            setState(() {});
                          });
                        }
                      },
                      color: Colors.teal,
                      textColor: white,
                      padding: EdgeInsets.all(10),
                      splashColor: lightPink,
                      child: profChild(),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
