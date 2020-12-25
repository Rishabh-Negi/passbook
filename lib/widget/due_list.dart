import '../model/account_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'due_tile.dart';

///
/// This create a widget to display [AccountList] from [AccountData] class
///
class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountData>(builder: (context, accountData, child) {
      var account = accountData.accounts;
      return ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: account.length,
        itemBuilder: (context, index) {
          ///
          /// This Allows [AccountTile] to be deleted from [AccountList] when Swipped horizontally
          ///
          return DueTile(
            due: account[index],

            ///
            /// [checkBox] function to change state of checkBox
            ///
            checkBoxToggle: (value) {
              Provider.of<AccountData>(context, listen: false)
                  .updateAccounts(account[index]);
            },
          );
        },
      );
    });
  }
}
