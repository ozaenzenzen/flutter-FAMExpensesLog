import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expenses Log",
          style: GoogleFonts.oxygen(
            color: Colors.white,
            fontSize: screenUtil.setSp(20),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
