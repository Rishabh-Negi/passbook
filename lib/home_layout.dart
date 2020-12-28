import 'screen/home_screen.dart';
import 'screen/passbook_screen.dart';
import 'screen/lock_screen.dart';
import 'package:flutter/material.dart';
import 'size_config.dart';

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
                HomeScreen(),
                PassbookScreen(),
                LockScreen(),
              ],
            ),
          );
        },
      );
}

//TODO: Remove Scaffold and replace with lockscreen
