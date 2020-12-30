import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'home_layout.dart';
import 'model/account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDirectory.path);
  Hive.registerAdapter(AccountAdapter());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passbook',
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
      theme: ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
