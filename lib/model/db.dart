import 'package:hive/hive.dart';

part 'db.g.dart';

@HiveType(typeId: 1)
class DB {
  @HiveField(0)
  String discription;
  @HiveField(1)
  int amount;
  @HiveField(2)
  String id;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  bool isCleared;

  DB(this.discription, this.amount, this.id, this.date,this.isCleared);
}
