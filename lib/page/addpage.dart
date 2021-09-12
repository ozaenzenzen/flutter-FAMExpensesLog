import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/model/expense_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  ExpenseModel expenseModel = ExpenseModel();

  ScreenUtil screenUtil = ScreenUtil();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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
                  controller: titleController,
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
                  controller: descController,
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
              height: screenUtil.setHeight(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date Time",
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: screenUtil.setSp(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019, 1),
                        lastDate: DateTime(2021, 12),
                      ).then((value) {
                        dateController.text =
                            DateFormat('EEEE, dd MMMM yyyy').format(value!);
                      });
                    });
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today_rounded,
                          size: screenUtil.setSp(20),
                        ),
                        labelText: "Date Time",
                        labelStyle: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: screenUtil.setSp(12),
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
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
                  if (expenseModel == null) {
                    // tambah data
                    expenseModel = ExpenseModel(
                      title: titleController.text,
                      desc: descController.text,
                      date: dateController.text,
                    );
                  } else {
                    // ubah data
                    expenseModel.title = titleController.text;
                    expenseModel.desc = descController.text;
                    expenseModel.date = dateController.text;
                  }
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
