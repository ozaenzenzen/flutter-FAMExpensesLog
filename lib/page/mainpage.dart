import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/page/addpage.dart';
import 'package:flutter_fam_expenseslog/utils/fam_strings.dart';
import 'package:flutter_fam_expenseslog/widget/expenselog_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScreenUtil screenUtil = ScreenUtil();
  FAMStrings famStrings = FAMStrings();

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
              return ExpensesLogItem(
                index: index,
                screenUtil: screenUtil,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[800],
        label: Text(
          "Add Log",
          style: GoogleFonts.quicksand(
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(
          CupertinoIcons.add_circled_solid,
          size: screenUtil.setSp(25),
        ),
        onPressed: () {
          Get.to(
            () => AddPage(),
          );
        },
      ),
    );
  }
}
