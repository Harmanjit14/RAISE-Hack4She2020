import 'package:RAISE/Auth.dart';
import 'package:RAISE/Dashboard.dart';
import 'package:RAISE/Profilepage.dart';
import 'package:RAISE/colorFile.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permissions_plugin/permissions_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<Permission, PermissionState> permission =
      await PermissionsPlugin.requestPermissions([
    Permission.ACCESS_FINE_LOCATION,
    Permission.ACCESS_COARSE_LOCATION,
    Permission.READ_PHONE_STATE
  ]);
  // runApp(MyApp(stat));
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget with ColorFile {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAISE',
      theme: ThemeData(
        primaryColor: white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => Auth(),
        '/dash': (context) => Dash(),
        '/editProfile': (context) => EditProfileScreen(),
        '/createProfile': (context) => CreateMyProfile(),
      },
      initialRoute: "/",
     
    );
  }
}
