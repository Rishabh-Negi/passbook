import 'package:hive_flutter/hive_flutter.dart';
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
    return WatchBoxBuilder(
      box: Hive.box('dues'),
      builder: (context, snap) {
        return ListView.builder(
          itemCount: snap.length,
          itemBuilder: (context, index) {
            final due = snap.getAt(index) as Account;
            return DueTile(
              due: due,
              checkBoxToggle: (value) {
                Account account = snap.getAt(index);
                account.toggleClear();
                debugPrint('$account');
                snap.putAt(index, account);
              },
            );
          },
        );
      },
    );
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
