import 'package:flutter/material.dart';

class Account {
  bool isCleared;
  String discription;
  int amount;
  String id;
  DateTime date;

  Account({
    @required this.discription,
    @required this.amount,
    @required this.id,
    @required this.date,
    this.isCleared = false,
  })  : assert(discription != null),
        assert(amount != null),
        assert(id != null);

  Account.map(dynamic obj) {
    this.id = obj['id'];
    this.date = obj['data'];
    this.amount = obj['amount'];
    this.isCleared = obj['isCleared'];
    this.discription = obj['discription'];
  }

  Account.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.date = map['data'];
    this.amount = map['amount'];
    this.isCleared = map['isCleared'];
    this.discription = map['discription'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['data'] = date;
    map['amount'] = amount;
    map['isCleared'] = isCleared;
    map['discription'] = discription;

    return map;
  }

  void toggleClear() {
    isCleared = !isCleared;
  }
}
