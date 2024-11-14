import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remindme/conrollers/task_controller.dart';
import 'package:remindme/ui/widgets/custom_appbar.dart';
import 'package:remindme/ui/widgets/remindfild.dart';
import 'package:remindme/ui/widgets/input_field.dart';
import 'package:remindme/ui/widgets/repeat.dart';
import 'package:remindme/ui/widgets/rowcirclecolor.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add task',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
      ),
      body: GetBuilder<TaskController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  InputField(
                    controller: controller.titleController,
                    labelText: 'Enter the Titel',
                    title: 'Titel',
                  ),
                  const SizedBox(height: 18),
                  InputField(
                    controller: controller.noteController,
                    labelText: 'Enter your Note',
                    title: 'Note',
                  ),
                  const SizedBox(height: 18),
                  InputField(
                    readOnly: true,
                    hintText:
                        DateFormat.yMd().format(controller.addselectedDate),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                      color: Colors.grey,
                    ),
                    title: 'Date',
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          readOnly: true,
                          hintText: controller.startTime,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.selectTime(context, 'start');
                              },
                              icon: const Icon(Icons.access_time),
                              color: Colors.grey),
                          title: 'Start Time',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InputField(
                          readOnly: true,
                          hintText: controller.endTime,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.selectTime(context, 'end');
                              },
                              icon: const Icon(Icons.access_time),
                              color: Colors.grey),
                          title: 'End Time',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Remind(),
                  const SizedBox(height: 18),
                  const Repeat(),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RowCircleColor(),
                      const SizedBox(width: 30),
                      ElevatedButton(
                          onPressed: () {
                            controller.validateData();
                          },
                          child: const Text('Creat Task'))
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
