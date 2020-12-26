import 'package:hive/hive.dart';

import '../screen/add_dues.dart';
import '../widget/due_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body = Scaffold(
      appBar: AppBar(title: Text('Dues')),

      ///
      /// body displays [DueList] which usees ListView.builder to lay down
      /// contents from list in [DueData]
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
            return Container(
              child: Text('${snap.error.toString()}'),
            );
          else
            return body;
        } else
          return Scaffold();
      },
    );
  }
}
