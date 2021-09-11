import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/utils/fam_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesLogItem extends StatelessWidget {
  const ExpensesLogItem({
    Key? key,
    required this.index,
    required this.screenUtil,
  }) : super(key: key);

  final ScreenUtil screenUtil;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: screenUtil.setHeight(70),
      width: screenUtil.screenWidth,
      margin: EdgeInsets.symmetric(
        vertical: screenUtil.setHeight(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        // color: Colors.red.shade200,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.red.shade200,
            spreadRadius: 0.5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(10),
          vertical: screenUtil.setWidth(10),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: screenUtil.setWidth(10),
              ),
              child: Icon(
                CupertinoIcons.app_fill,
                size: screenUtil.setSp(60),
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(10),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${FAMStrings.lorem_ipsum_title} $index",
                      // "Judul $index",
                      softWrap: true,
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: screenUtil.setSp(18),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    Text(
                      "${FAMStrings.lorem_ipsum_desc}",
                      // "Description",
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: screenUtil.setSp(12),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
