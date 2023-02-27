import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/controller/functions/db_functions.dart';
import 'package:money_manager/screens/home/model/hive_model.dart';
import 'package:money_manager/screens/widgets/pop_snakbar.dart';

class HomeController extends ChangeNotifier {
  HomeController(context) {
    getAllData();
  }

  final TextEditingController noteController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  bool isClicked1 = false;
  bool isClicked2 = false;
  String type = '';
  DbFunctions db = DbFunctions();
  List<HiveModel> dataFound = [];

  Future<void> getAllData() async {
    final data = await DbFunctions().getAllDatas();
    dataFound = data;
    notifyListeners();
  }

  Future<void> deleteData(String id, context, String value) async {
    if (id.isEmpty) {
      log('No id');
    } else {
      await DbFunctions().deleteData(context, id);
      Popsnakbar().popUpSnackBar(
        context,
        '$value delete successfully',
        Colors.red,
      );
      getAllData();
      log('deleted successfully');
    }
    notifyListeners();
  }

  Future<void> saveData(context) async {
    final manager = HiveModel(
      note: noteController.text.trimLeft(),
      amount: amountController.text,
      date:
          "${dateTime.day}/${dateTime.month}/${dateTime.year} ${(dateTime.hour).toString().padLeft(2, "0")}:${(dateTime.minute).toString().padLeft(2, "0")}",
      photo: '',
      type: type,
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    db.addData(manager).then((value) {
      Navigator.pop(context);
      controllerClear();
      log("data added");
      getAllData();
    });
    notifyListeners();
  }

  void controllerClear() {
    noteController.clear();
    amountController.clear();
    isClicked1 = false;
    isClicked2 = false;
  }

  void incomeButtonPress() {
    type = 'Income';
    isClicked1 = !isClicked1;
    isClicked2 = false;
    notifyListeners();
  }

  void outComeButtonPress() {
    type = 'Outcome';
    isClicked2 = !isClicked2;
    isClicked1 = false;
    notifyListeners();
  }

  DateTime dateTime = DateTime.now();

  Future<DateTime?> datePicker(context) {
    return showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  Future<TimeOfDay?> timePicker(context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: dateTime.hour,
        minute: dateTime.minute,
      ),
    );
  }

  Future pickDateTime(context) async {
    DateTime? date = await datePicker(context);
    if (date == null) return;
    TimeOfDay? time = await timePicker(context);
    if (time == null) return;
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    this.dateTime = dateTime;
    notifyListeners();
  }
}
