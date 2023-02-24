import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/controller/functions/db_functions.dart';
import 'package:money_manager/screens/home/model/hive_model.dart';

class HomeController extends ChangeNotifier {
  HomeController(context) {
    getAllData();
  }
  final TextEditingController noteController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DbFunctions db = DbFunctions();
  List<HiveModel> dataFound = [];

  Future<void> getAllData() async {
    final data = await DbFunctions().getAllDatas();
    dataFound = data;
    notifyListeners();
  }

  Future<void> deleteData(String id, context) async {
    if (id.isEmpty) {
      log('No id');
    } else {
      await DbFunctions().deleteData(context, id);
      getAllData();
      log('deleted successfully');
    }
    notifyListeners();
  }

  Future<void> saveData(context) async {
    final manager = HiveModel(
      note: noteController.text.trimLeft(),
      amount: amountController.text,
      date: dateController.text,
      photo: '',
      type: '',
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    db.addData(manager).then((value) {
      Navigator.pop(context);
      controllerClear();
      print("data added");
      getAllData();
    });
    notifyListeners();
  }

  void controllerClear() {
    noteController.clear();
    amountController.clear();
    dateController.clear();
  }
}
