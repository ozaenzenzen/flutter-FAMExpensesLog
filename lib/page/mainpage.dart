import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_expenseslog/model/expense_model.dart';
import 'package:flutter_fam_expenseslog/page/addpage.dart';
import 'package:flutter_fam_expenseslog/services/db_helper.dart';
import 'package:flutter_fam_expenseslog/services/db_provider.dart';
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
  DBHelper dbHelper = DBHelper();
  int count = 0;
  List<ExpenseModel>? expenseList;

  ScreenUtil screenUtil = ScreenUtil();
  FAMStrings famStrings = FAMStrings();

  Future? data;

  @override
  Widget build(BuildContext context) {
    // if (expenseList == null) {
    //   expenseList = <ExpenseModel>[];
    // }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(5),
            horizontal: screenUtil.setWidth(20),
          ),
          child: StreamBuilder<List<ExpenseModel>>(
              stream: DBProvider.dbProvider.streamData(),
              // child: FutureBuilder(
              //     future: DBProvider.dbProvider.selectAllData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ExpenseModel>> snapshot) {
                // print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    // itemCount: 10,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenUtil.setWidth(15),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Delete",
                            style: GoogleFonts.poppins(
                              fontSize: screenUtil.setSp(25),
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.red,
                        ),
                        // onDismissed: (direction) {
                        //   DBProvider.dbProvider.deleteData(
                        //     int.parse(snapshot.data![index].id.toString()),
                        //   );
                        // },
                        child: ExpensesLogItem(
                          id: snapshot.data![index].id.toString(),
                          title: snapshot.data![index].title.toString(),
                          desc: snapshot.data![index].desc.toString(),
                          date: snapshot.data![index].date.toString(),
                          index: index,
                          screenUtil: screenUtil,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[800],
        label: Text(
          "Add Log",
          style: GoogleFonts.quicksand(
            fontSize: screenUtil.setSp(13),
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
            arguments: {'type': 'Add'},
          );
        },
      ),
    );
  }
}
