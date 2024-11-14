import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskBar extends StatelessWidget {
  final DateTime date;
  final void Function()? onPressed;
  const TaskBar({
    Key? key,
    required this.date,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(date),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              // const Text('Today',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(onPressed: onPressed, child: const Text('+ Add Task'))
        ],
      ),
    );
  }
}
