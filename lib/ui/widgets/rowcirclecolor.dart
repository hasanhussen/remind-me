import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindme/conrollers/task_controller.dart';

class RowCircleColor extends StatelessWidget {
  const RowCircleColor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Color',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColoredCircle(
                color: Colors.red,
                isChecked: controller.isCircle1Checked,
                onTap: () {
                  controller.chooseCircleColor(1);
                },
              ),
              const SizedBox(width: 6),
              ColoredCircle(
                color: Colors.green,
                isChecked: controller.isCircle2Checked,
                onTap: () {
                  controller.chooseCircleColor(2);
                },
              ),
              const SizedBox(width: 6),
              ColoredCircle(
                color: Colors.blue,
                isChecked: controller.isCircle3Checked,
                onTap: () {
                  controller.chooseCircleColor(3);
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}

class ColoredCircle extends StatelessWidget {
  final Color color;
  final bool isChecked;
  final VoidCallback onTap;

  const ColoredCircle({
    super.key,
    required this.color,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          if (isChecked)
            const Icon(
              Icons.check,
              color: Colors.white,
              size: 24.0,
            ),
        ],
      ),
    );
  }
}
