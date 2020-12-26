import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account {
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

  Account({
    @required this.discription,
    @required this.amount,
    @required this.id,
    @required this.date,
    this.isCleared = false,
  })  : assert(discription != null),
        assert(amount != null),
        assert(id != null);

  void toggleClear() {
    isCleared = !isCleared;
  }
}
