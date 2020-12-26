import 'package:passbook/model/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'due_tile.dart';

///
/// This create a widget to display [AccountList] from [AccountData] class
///
class AccountList extends StatelessWidget {
  final List account = [];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('dues').listenable(),
      builder: (context, box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final due = box.getAt(index) as Account;
            return DueTile(
              due: due,
              checkBoxToggle: (value) {
                Account account = box.getAt(index) as Account;
                account.toggleClear();
                box.putAt(index, account);
              },
            );
          },
        );
      },
    );
  }
}
