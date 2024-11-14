import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/conrollers/task_controller.dart';

class Repeat extends StatelessWidget {
  const Repeat({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    DropdownButton<String> bulidrepeatDropdownButton(List repeatlist) {
      return DropdownButton<String>(
        underline: Container(height: 0),
        items: repeatlist
            .map<DropdownMenuItem<String>>((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: (newValue) {
          taskController.onRepeatChanged(newValue);
        },
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 34,
        dropdownColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      );
    }

    return GetBuilder<TaskController>(
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Repeat',
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
                        hintText: controller.selectedRepeatValue,
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
                bulidrepeatDropdownButton(controller.repeat),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
