import 'home_layout.dart';
import 'model/account_data.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountData>(
      create: (context) => AccountData(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Passbook',
          debugShowCheckedModeBanner: false,
          home: HomeLayout(),
          theme: ThemeData.light().copyWith(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        );
      },
    );
  }
}
