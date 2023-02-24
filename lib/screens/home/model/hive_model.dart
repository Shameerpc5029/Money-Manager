import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class HiveModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String note;
  @HiveField(2)
  final String amount;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String photo;
  @HiveField(5)
  final String type;

  HiveModel({
    required this.note,
    required this.amount,
    required this.date,
    required this.photo,
    required this.type,
    this.id,
  });
}
