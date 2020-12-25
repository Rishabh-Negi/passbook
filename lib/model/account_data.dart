import 'dart:collection';
import 'package:flutter/material.dart';
import 'account.dart';

class AccountData extends ChangeNotifier {
  List<Account> _accounts = [
    Account(
        discription: 'Hussain', amount: -300, id: '1', date: DateTime.now()),
    Account(discription: 'Bajaj', amount: 500, id: '2', date: DateTime.now()),
  ];

  UnmodifiableListView<Account> get accounts => UnmodifiableListView(_accounts);
  int get length => _accounts.length;

  void addAccounts(Account newAccount) {
    _accounts.add(newAccount);
    notifyListeners();
  }

  void removeAccounts(Account account) {
    _accounts.remove(account);
    notifyListeners();
  }

  void updateAccounts(Account account) {
    account.toggleClear();
    notifyListeners();
  }
}
