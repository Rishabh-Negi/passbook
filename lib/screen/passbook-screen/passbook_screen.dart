import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passbook/model/account.dart';
import 'package:passbook/screen/passbook-screen/widget/passbook_list.dart';

class PassbookScreen extends StatefulWidget {
  @override
  _PassbookScreenState createState() => _PassbookScreenState();
}

class _PassbookScreenState extends State<PassbookScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<Account>('passbook'),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError)
            return Scaffold(
              appBar: AppBar(title: Text('Connection Error')),
              body: Center(child: Text('${snap.error.toString()}')),
            );
          return Scaffold(
            appBar: AppBar(
              title: Text('Passbook'),
            ),
            body: PassbookList(),
          );
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
