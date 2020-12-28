import 'package:passbook/model/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'due_tile.dart';

import 'package:grouped_list/grouped_list.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('dues').listenable(),
      builder: (context, box, _) {
        List<Account> _list = List.generate(
          box.length,
          (index) => box.getAt(index) as Account,
        );
        return Container();
      },
    );
  }
}
// ListView.builder(
//           itemCount: box.length,
//           itemBuilder: (context, index) {
//             final due = box.getAt(index) as Account;
//             return DueTile(
//               due: due,
//               checkBoxToggle: (value) {
//                 Account account = box.getAt(index);
//                 account.toggleClear();
//                 box.putAt(index, account);
//               },
//             );
//           },
//         );
