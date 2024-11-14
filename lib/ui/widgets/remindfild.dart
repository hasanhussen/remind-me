import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/conrollers/task_controller.dart';

class Remind extends StatelessWidget {
  const Remind({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    DropdownButton<String> bulidremindDropdownButton(List<int> remindlist) {
      return DropdownButton(
        underline: Container(height: 0),
        items: remindlist
            .map<DropdownMenuItem<String>>(
                (int option) => DropdownMenuItem<String>(
                      value: option.toString(),
                      child: Text('$option'),
                    ))
            .toList(),
        onChanged: (newValue) {
          taskController.onRemindChanged(newValue);
        },
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 34,
        dropdownColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      );
    }

    return GetBuilder<TaskController>(builder: (controller) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Remind',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Container(
          padding: const EdgeInsets.only(left: 4.0),
          width: double.infinity,
          margin: const EdgeInsets.only(left: 11),
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: '${controller.selectedRemindValue} Minuts',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent),
                      )),
                ),
              ),
              const SizedBox(width: 15),
              bulidremindDropdownButton(controller.remindlist),
            ],
          ),
        ),
      ]);
    });
  }
}
