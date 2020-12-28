import 'package:hive/hive.dart';
import 'package:passbook/model/account.dart';

import '../screen/add_dues.dart';
import '../widget/due_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('dues'),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError)
            return Scaffold(
              appBar: AppBar(title: Text('Connection Error')),
              body: Center(child: Text('${snap.error.toString()}')),
            );
          else
            return home(context);
        } else
          return Scaffold(
            appBar: AppBar(title: Text('...')),
            body: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }

  Widget home(context) => Scaffold(
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

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
