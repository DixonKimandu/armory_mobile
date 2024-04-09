import 'package:armory_mobile/pages/Barracks.dart';
import 'package:armory_mobile/pages/central-armory/ArmoryRecord.dart';
import 'package:armory_mobile/pages/central-armory/CentralArmory.dart';
import 'package:armory_mobile/pages/ForgotPassword.dart';
import 'package:armory_mobile/pages/Home.dart';
import 'package:armory_mobile/pages/Login.dart';
import 'package:armory_mobile/pages/Menu.dart';
import 'package:armory_mobile/pages/Profile.dart';
import 'package:armory_mobile/pages/ResetPassword.dart';
import 'package:armory_mobile/pages/Settings.dart';
import 'package:armory_mobile/pages/Splash.dart';
import 'package:armory_mobile/pages/police-station/DispatchRequest.dart';
import 'package:armory_mobile/pages/police-station/PoliceStationRequests.dart';
import 'package:armory_mobile/pages/police-station/RequestRecord.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const Splash(),
        '/login': (_) => const Login(),
        '/home': (_) => const Home(),
        '/barracks': (_) => const Barracks(),
        '/central-armory': (_) => const CentralArmory(),
        '/police-station-requests': (_) => const PoliceStationRequests(),
        '/forgot-password': (_) => const ForgotPassword(),
        '/reset-password': (_) => const ResetPassword(),
        '/settings': (_) => const Settings(),
        '/profile': (_) => const Profile(),
        '/menu': (_) => const Menu(),
        '/request-record':(_) => const RequestRecord(),
        '/dispatch-request': (_) => const DispatchRequest(),
        '/armory-record': (_) => const AmoryRecord()
      },
    );
  }
}
