import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesLogItem extends StatelessWidget {
  const ExpensesLogItem({
    Key? key,
    required this.title,
    required this.index,
    required this.date,
    required this.screenUtil,
    required this.desc,
  }) : super(key: key);

  final ScreenUtil screenUtil;
  final int index;

  final String title;
  final String desc;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenUtil.screenWidth,
      margin: EdgeInsets.symmetric(
        vertical: screenUtil.setHeight(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        // color: Colors.red.shade200,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: Colors.red.shade100,
            spreadRadius: 1,
            blurRadius: 8,
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
            Icon(
              CupertinoIcons.app_fill,
              size: screenUtil.setSp(100),
              color: Colors.grey.shade400,
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
                      "$title",
                      // "$title $index",
                      // "${FAMStrings.lorem_ipsum_title} $index",
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
                      "$desc",
                      // "${FAMStrings.lorem_ipsum_desc}",
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
                    SizedBox(
                      height: screenUtil.setHeight(15),
                    ),
                    Text(
                      "$date",
                      // "${FAMStrings.lorem_ipsum_desc}",
                      // "Description",
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: screenUtil.setSp(10),
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
