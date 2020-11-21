import 'package:RAISE/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  int x = 0;
  @override
  void initState() async {
    // TODO: implement initState
    x = await getJobs();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      return Center(
        child: SpinKitWaveType(
          
        ),
      );
    }else{

    }
  }
}
