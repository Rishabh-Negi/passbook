import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passbook/model/account.dart';

import 'widget/add_dues.dart';
import 'widget/due_list.dart';

class DueScreen extends StatefulWidget {
  @override
  _DueScreenState createState() => _DueScreenState();
}

class _DueScreenState extends State<DueScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<Account>('dues'),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError)
            return Scaffold(
              appBar: AppBar(title: Text('Connection Error')),
              body: Center(child: Text('${snap.error.toString()}')),
            );
          else
            return Scaffold(
              appBar: AppBar(title: Text('Dues')),
              body: AccountList(),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: AddDuesScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            );
        } else
          return Scaffold(
            appBar: AppBar(title: Text('...')),
            body: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
