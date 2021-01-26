import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../constants/style.dart';
import '../../../model/account.dart';
import '../../../widget/dateTime_picker.dart';

class AddDuesScreen extends StatefulWidget {
  @override
  _AddDuesScreenState createState() => _AddDuesScreenState();
}

class _AddDuesScreenState extends State<AddDuesScreen> {
  String _id;
  String _discription;
  String _name;
  int _amount;
  DateTime _currentDate = DateTime.now();
  TimeOfDay _currentTime = TimeOfDay.now();

  final Box<Account> _dueBox = Hive.box<Account>('dues');

  String _generateId() {
    DateTime currentDate = DateTime.now();
    String date = currentDate.toString().split('.')[0];
    List<String> dateParts = date.split(' ');

    date = dateParts[0].toString() + '_' + dateParts[1].toString();
    return UniqueKey().toString() +
        ':' +
        date +
        currentDate.millisecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.0),
        Text(
          'Add Account',
          textAlign: TextAlign.center,
          style: kAddDueStyle,
        ),
        SizedBox(height: 10.0),
        ListTile(
          leading: discriptionIcon,
          title: TextField(
            autofocus: true,
            textAlign: TextAlign.left,
            decoration: InputDecoration(hintText: 'Enter The name'),
            onChanged: (String value) {
              _name = value;
            },
          ),
        ),
        SizedBox(height: 10.0),
        ListTile(
          leading: discriptionIcon,
          title: TextField(
            autofocus: true,
            textAlign: TextAlign.left,
            decoration: InputDecoration(hintText: 'Enter The Discription'),
            onChanged: (String value) {
              _discription = value;
            },
          ),
        ),
        SizedBox(height: 10.0),
        ListTile(
          leading: amountIcon,
          title: TextField(
            autofocus: true,
            textAlign: TextAlign.left,
            decoration: InputDecoration(hintText: 'Enter The Amount'),
            onChanged: (String value) {
              _amount = int.parse(value);
            },
          ),
        ),
        SizedBox(height: 10.0),
        DateTimePicker(
          selectedDate: _currentDate,
          selectedTime: _currentTime,
          selectDate: (DateTime newDate) {
            _currentDate = newDate;
          },
          selectTime: (TimeOfDay newTime) {
            _currentTime = newTime;
          },
        ),
        SizedBox(height: 10.0),
        ListTile(
          tileColor: Colors.lightBlueAccent,
          title: Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Account due;
            var d = _currentDate;
            var t = _currentTime;
            _currentDate = DateTime(d.year, d.month, d.day, t.hour, t.minute);
            _id = _generateId();

            if (_discription != null || _amount != null) {
              due = Account(
                name: _name,
                amount: _amount,
                date: _currentDate,
                discription: _discription,
                id: _id,
              );

              _dueBox.add(due);
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
