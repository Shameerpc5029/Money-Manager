import 'package:hive/hive.dart';
import 'package:money_manager/screens/home/model/hive_model.dart';

class DbFunctions {
  final List<HiveModel> managerList = [];

  Future<void> addData(HiveModel value) async {
    final managerDb = await Hive.openBox<HiveModel>('manager_db');
    await managerDb.put(value.id, value);
    managerList.add(value);
    getAllDatas();
  }

  Future<List<HiveModel>> getAllDatas() async {
    final managerDb = await Hive.openBox<HiveModel>('manager_db');
    managerList.clear();
    managerList.addAll(managerDb.values);
    return managerList;
  }

  Future<void> deleteData(context, String index) async {
    final managerDb = await Hive.openBox<HiveModel>('manager_db');
    await managerDb.delete(index);
    getAllDatas();
  }
}
