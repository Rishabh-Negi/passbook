import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passbook/model/account.dart';

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('expenses').listenable(),
      builder: (context, box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            Account due = box.getAt(index);
            return ListTile(
              leading: Icon(Icons.money_off),
              title: Text('${due.name}'),
              subtitle: Text('${due.discription}'),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${due.amount}'),
                  Text('${due.date}'),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
