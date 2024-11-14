import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remindme/conrollers/task_controller.dart';
import 'package:remindme/services/function.dart';
import 'package:remindme/ui/pages/add_task_page.dart';
import 'package:remindme/ui/widgets/custom_appbar.dart';
import 'package:remindme/ui/widgets/datebar.dart';
import 'package:remindme/ui/widgets/taskbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.put(TaskController());
    return Scaffold(
      appBar: CustomAppBar(
          title: 'My Notes',
          leading: IconButton(
            icon: const Icon(
              Icons.cleaning_services_outlined,
              size: 24,
              color: Color.fromARGB(255, 210, 16, 3),
            ),
            onPressed: () {
              taskController.deleteAllTask();
              taskController.notifyHelper.cancelAllNotification();
            },
          )),
      body: GetBuilder<TaskController>(
        builder: (controller) {
          return Column(
            children: [
              TaskBar(
                date: controller.selectedDate,
                onPressed: () async {
                  await Get.to(const AddTaskPage());
                },
              ),
              const SizedBox(height: 15),
              DateBar(
                onDateChange: (DateTime newDate) {
                  controller.onDateChange(newDate);
                },
              ),
              const SizedBox(height: 15),
              showTask(),
            ],
          );
        },
      ),
    );
  }
}
