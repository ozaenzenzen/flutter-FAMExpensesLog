import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/page/addpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesLogItem extends StatefulWidget {
  ExpensesLogItem({
    this.id,
    required this.title,
    required this.index,
    required this.date,
    required this.screenUtil,
    required this.desc,
  });

  final ScreenUtil screenUtil;
  final int index;

  final String? id;
  final String title;
  final String desc;
  final String date;

  @override
  _ExpensesLogItemState createState() => _ExpensesLogItemState();
}

class _ExpensesLogItemState extends State<ExpensesLogItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => AddPage(),
          arguments: {
            'type': 'Edit',
            'id': widget.id,
            'title': widget.title,
            'desc': widget.desc,
            'date': widget.date,
          },
        );
      },
      child: Container(
        width: widget.screenUtil.screenWidth,
        margin: EdgeInsets.symmetric(
          vertical: widget.screenUtil.setHeight(10),
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
            horizontal: widget.screenUtil.setWidth(10),
            vertical: widget.screenUtil.setWidth(10),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.app_fill,
                size: widget.screenUtil.setSp(100),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                width: widget.screenUtil.setWidth(10),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.title}",
                        // "$title $index",
                        // "${FAMStrings.lorem_ipsum_title} $index",
                        // "Judul $index",
                        softWrap: true,
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: widget.screenUtil.setSp(18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: widget.screenUtil.setHeight(5),
                      ),
                      Text(
                        "${widget.desc}",
                        // "${FAMStrings.lorem_ipsum_desc}",
                        // "Description",
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: widget.screenUtil.setSp(12),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: widget.screenUtil.setHeight(15),
                      ),
                      Text(
                        "${widget.date}",
                        // "${FAMStrings.lorem_ipsum_desc}",
                        // "Description",
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: widget.screenUtil.setSp(10),
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
      ),
    );
  }
}
