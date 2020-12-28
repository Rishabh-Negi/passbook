import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account {
  @HiveField(0)
  String name;
  @HiveField(1)
  String discription;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String id;
  @HiveField(4)
  DateTime date;
  @HiveField(5)
  bool isCleared;

  Account({
    @required this.name,
    @required this.discription,
    @required this.amount,
    @required this.id,
    @required this.date,
    this.isCleared = false,
  })  : assert(name != null),
        assert(discription != null),
        assert(amount != null),
        assert(id != null);

  void toggleClear() {
    isCleared = !isCleared;
  }

  Account.tomap(){}
}
