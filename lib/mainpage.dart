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
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          "Expenses Log",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: screenUtil.setSp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // physics: ScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenUtil.setWidth(20),
          ),
          child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: screenUtil.setHeight(70),
                width: screenUtil.screenWidth,
                margin: EdgeInsets.symmetric(
                  vertical: screenUtil.setHeight(10),
                ),
                decoration: BoxDecoration(color: Colors.red.shade200),
              );
            },
          ),
        ),
      ),
    );
  }
}
