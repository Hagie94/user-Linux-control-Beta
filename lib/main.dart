import 'package:flutter/material.dart';
import 'package:usersyscontrol/pages/dashboard.dart';
import 'package:usersyscontrol/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/success': (context) => IfNotSucceed(),
      },
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}
