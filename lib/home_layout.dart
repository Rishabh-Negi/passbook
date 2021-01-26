import 'package:flutter/material.dart';
import 'package:passbook/widget/page.dart';

import 'constants/size_config.dart';
import 'screen/due-screen/due_screen.dart';
import 'screen/expense-screen/lock_screen.dart';
import 'screen/passbook-screen/passbook_screen.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int pageNo;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          SizeConfig(constraints);
          return Scaffold(
            body: PageView(
              children: [
                BuildPage(child: PassbookScreen()),
                BuildPage(child: DueScreen()),
                BuildPage(child: LockScreen()),
              ],
            ),
          );
        },
      );
}

//TODO: Remove Scaffold and replace with lockscreen
