import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> selectDate;
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> selectTime;

  const DateTimePicker(
      {this.selectedDate, this.selectDate, this.selectedTime, this.selectTime});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (picked != null && picked != selectedTime) selectTime(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: _InputDropDown(
              labelText: 'Date',
              valueText: DateFormat.yMMMd().format(selectedDate),
              onPressed: () {
                _selectDate(context);
              },
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            flex: 3,
            child: _InputDropDown(
              labelText: 'Time',
              valueText: selectedTime.format(context),
              onPressed: () {
                _selectTime(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _InputDropDown extends StatelessWidget {
  final VoidCallback onPressed;
  final String valueText;
  final String labelText;

  const _InputDropDown(
      {Key key, this.onPressed, this.valueText, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(labelText: labelText),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$valueText'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
