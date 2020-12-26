import 'package:passbook/model/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'due_tile.dart';

///
/// This create a widget to display [AccountList] from [AccountData] class
///
class AccountList extends StatelessWidget {
  final List account = [];

  @override
  Widget build(BuildContext context) {
    final _duesBox = Hive.openBox('dues');
    return StreamBuilder(
        stream: _duesBox.asStream(),
        builder: (context, snap) {
          if (snap.hasData) {
            final data = snap.data;

            return ListView.builder(itemBuilder: (context, index) {
              final due = data.getAt(index) as Account;
              return DueTile(
                 due: due,
                 checkBoxToggle: (){},
              );
            });
          }
          return Container();
        });
  }
}

// ListView.builder(
//       padding: EdgeInsets.only(top: 20),
//       itemCount: account.length,
//       itemBuilder: (context, index) {
//         ///
//         /// This Allows [AccountTile] to be deleted from [AccountList] when Swipped horizontally
//         ///
//         return DueTile(
//           due: account[index],

//           ///
//           /// [checkBox] function to change state of checkBox
//           ///
//           checkBoxToggle: (value) {
//             // Provider.of<AccountData>(context, listen: false)
//             //     .updateAccounts(account[index]);
//           },
//         );
//       },
//     );
