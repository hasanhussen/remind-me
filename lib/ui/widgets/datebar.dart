import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateBar extends StatelessWidget {
  final void Function(DateTime)? onDateChange;

  const DateBar({super.key, required this.onDateChange});
  @override
  Widget build(BuildContext context) {
    return DatePicker(DateTime.now(),
        dateTextStyle: const TextStyle(color: Colors.grey),
        dayTextStyle: const TextStyle(color: Colors.grey),
        monthTextStyle: const TextStyle(color: Colors.grey),
        selectedTextColor: Colors.white,
        selectionColor: Colors.blue,
        width: 70,
        height: 100,
        initialSelectedDate: DateTime.now(),
        onDateChange: onDateChange);
  }
}
