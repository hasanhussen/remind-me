// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:remindme/conrollers/task_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness:
                taskController.isDark ? Brightness.dark : Brightness.light,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor:
              taskController.isDark ? Colors.black12 : Colors.white,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: taskController.isDark ? Colors.white : Colors.black),
          ),
          leading: leading,
          actions: [
            IconButton(
              icon: Icon(
                taskController.isDark ? Icons.wb_sunny : Icons.nights_stay,
                color: taskController.isDark ? Colors.white : Colors.black,
              ),
              onPressed: taskController.toggleTheme,
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
