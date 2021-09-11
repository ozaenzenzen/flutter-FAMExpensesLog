import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  ScreenUtil screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          "Add Log Page",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: screenUtil.setSp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(20),
          vertical: screenUtil.setHeight(20),
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Expense Title",
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: screenUtil.setSp(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Expense Title",
                    labelStyle: GoogleFonts.quicksand(
                      color: Colors.grey,
                      fontSize: screenUtil.setSp(12),
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Expense Desc",
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: screenUtil.setSp(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Expense Desc",
                    labelStyle: GoogleFonts.quicksand(
                      color: Colors.grey,
                      fontSize: screenUtil.setSp(12),
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(25),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade800,
                  minimumSize: Size(
                    screenUtil.setWidth(100),
                    screenUtil.setHeight(40),
                  ),
                ),
                onPressed: () {
                  //
                },
                child: Text(
                  "Add Log!",
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: screenUtil.setSp(15),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
