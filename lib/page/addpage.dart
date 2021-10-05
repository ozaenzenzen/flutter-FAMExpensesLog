import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/model/expense_model.dart';
import 'package:flutter_fam_expenseslog/services/db_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  dynamic data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var id = data['id'];
    // var title = data['title'];
    // var desc = data['desc'];
    // var date = data['date'];
    // print(data);
    // print(data['type']);

    if (data['type'] == 'Edit') {
      titleController.text = data['title'];
      descController.text = data['desc'];
      dateController.text = data['date'];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          (data['type'] == 'Add') ? "Add Log Page" : "Update Log Page",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: screenUtil.setSp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    maxLines: 4,
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
                  onPressed: () async {
                    if (data['type'] == 'Add') {
                      if (titleController.text.isEmpty ||
                          descController.text.isEmpty ||
                          dateController.text.isEmpty) {
                        var expenseModel = ExpenseModel(
                          title: "",
                          desc: "",
                          date: "",
                        );
                        setState(() {
                          DBProvider.dbProvider
                              .insertData(expenseModel)
                              .whenComplete(() => Get.back());
                          // await DBProvider.dbProvider.insertData(expenseModel).whenComplete(() => Get.back());
                        });
                      } else {
                        var expenseModel = ExpenseModel(
                          title: titleController.text,
                          desc: descController.text,
                          date: dateController.text,
                        );
                        setState(() {
                          DBProvider.dbProvider
                              .insertData(expenseModel)
                              .whenComplete(() => Get.back());
                          // await DBProvider.dbProvider.insertData(expenseModel).whenComplete(() => Get.back());
                        });
                      }
                    } else {
                      var expenseModel = ExpenseModel(
                        id: int.parse(id),
                        title: titleController.text,
                        desc: descController.text,
                        date: dateController.text,
                      );

                      setState(() {
                        DBProvider.dbProvider
                            .updateData(expenseModel)
                            .whenComplete(() {
                          return Get.back();
                        });
                      });
                      // DBProvider.dbProvider.updateData(expenseModel);
                      // Get.offAll(() => MainPage(),transition: Transition.leftToRight);
                    }
                  },
                  child: Text(
                    (data['type'] == 'Add') ? "Add Log!" : "Update Log!",
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
      ),
    );
  }
}
