import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/mainpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return GetMaterialApp(
          title: "FAM Expenses Log | Sqflite",
          home: MainPage(),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
        );
      },
    );
  }
}
