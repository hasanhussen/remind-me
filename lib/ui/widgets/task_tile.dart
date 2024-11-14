import 'package:flutter/material.dart';
import 'package:remindme/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: getcolor(task.color)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          task.title!,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          const Icon(Icons.access_alarm_rounded, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '${task.startTime!} - ${task.endTime!}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          task.note!,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      // const SizedBox(height: 7),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 2, height: 80, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(width: 5),
            RotatedBox(
              quarterTurns: 3,
              child: task.isCompleted == 0
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '  To Do  ',
                        style: TextStyle(fontSize: 15),
                      ),
                    ))
                  : const Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Complited',
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
            )
          ],
        ),
      ),
    );
  }

  MaterialColor getcolor(int? color) {
    switch (color) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      default:
        return Colors.red;
    }
  }
}
