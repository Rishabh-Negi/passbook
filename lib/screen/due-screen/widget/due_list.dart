import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../model/account.dart';
import '../../../widget/due_tile.dart';

class AccountList extends StatelessWidget {
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
                Account account = box.getAt(index);
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
