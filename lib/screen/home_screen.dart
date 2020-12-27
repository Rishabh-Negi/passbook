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
    Widget home = Scaffold(
      appBar: AppBar(title: Text('Dues')),

      ///
      /// body displays [DueList] which uses ListView.builder
      ///
      body: AccountList(),

      ///
      /// [FAB] on pressed discplay a [BottomSheet] from [Scaffold] class
      /// which allows user to add dues
      ///
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
            return home;
        } else
          return Scaffold(
            appBar: AppBar(title: Text('...')),
            body: Center(child: CircularProgressIndicator()),

            ///
            ///add an INTRO Animation Page Here
            ///
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
