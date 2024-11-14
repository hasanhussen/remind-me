import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remindme/conrollers/task_controller.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/ui/widgets/task_tile.dart';

TaskController taskController = Get.find();

bulidcontainer(String label, Function ontap) {
  return GestureDetector(
    onTap: () {
      ontap();
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blue),
      child: Text(label, textAlign: TextAlign.center),
    ),
  );
}

buildBottomsheet(BuildContext context, Task task) {
  Get.bottomSheet(Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: taskController.isDark ? Colors.white : Colors.grey),
    child: SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 10),
        task.isCompleted == 0
            ? bulidcontainer('Completed Task', () {
                taskController.notifyHelper.cancelNotification(task);
                taskController.makeIsCopleted(task.id!);
                Get.back();
              })
            : Container(),
        const SizedBox(height: 5),
        bulidcontainer('delete Task', () {
          taskController.notifyHelper.cancelNotification(task);
          taskController.deleteTask(task);
          Get.back();
        }),
        const SizedBox(height: 3),
        const Divider(height: 3, color: Colors.grey),
        const SizedBox(height: 3),
        bulidcontainer('cancel Task', () {
          Get.back();
        }),
        const SizedBox(height: 10),
      ],
    )),
  ));
}

showTask() {
  return Expanded(
      child: taskController.taskList.isEmpty
          ? noTaskMasseg()
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var task = taskController.taskList[index];

                if (task.repeat == 'Daily' ||
                    task.date ==
                        DateFormat.yMd().format(taskController.selectedDate) ||
                    (task.repeat == 'Weekly' &&
                        taskController.selectedDate
                                    .difference(
                                        DateFormat.yMd().parse(task.date!))
                                    .inDays %
                                7 ==
                            0) ||
                    (task.repeat == 'Monthly' &&
                        DateFormat.yMd().parse(task.date!).day ==
                            taskController.selectedDate.day) ||
                    (task.repeat == 'Annually' &&
                        (DateFormat.yMd().parse(task.date!).month ==
                                taskController.selectedDate.month &&
                            DateFormat.yMd().parse(task.date!).day ==
                                taskController.selectedDate.day))) {
                  final inputDate =
                      DateFormat('hh:mm a').parse(task.startTime.toString());
                  final outputDate = DateFormat('HH:mm').format(inputDate);
                  final parts = outputDate.toString().split(':');
                  var hour = parts[0];
                  // print('hour=' + hour);
                  var minutes = parts[1];
                  // print('minutes=' + minutes);

                  taskController.notifyHelper.scheduledNotification(
                      int.parse(hour), int.parse(minutes), task);

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 300,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            buildBottomsheet(context, task);
                          },
                          child: TaskTile(task: task),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: taskController.taskList.length,
            ));
}

noTaskMasseg() {
  return Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        'images/task.svg',
        height: 70,
        // ignore: deprecated_member_use
        color: Colors.blueGrey,
      ),
      const SizedBox(height: 10),
      const Text(
        'you do not have any notes yet',
        style: TextStyle(
            fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    ]),
  );
}
