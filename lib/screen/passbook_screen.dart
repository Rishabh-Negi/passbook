import 'package:flutter/material.dart';

class PassbookScreen extends StatefulWidget {
  @override
  _PassbookScreenState createState() => _PassbookScreenState();
}

class _PassbookScreenState extends State<PassbookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      // body: ExpenseList(),
    );
  }
}
