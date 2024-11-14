import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remindme/db/db_helper.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/services/notification_services.dart';

class TaskController extends GetxController {
  final taskList = <Task>[];
  late NotifyHelper notifyHelper;
  bool isDark = false;
  DateTime selectedDate = DateTime.now();

  //addtask
  final TextEditingController noteController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  DateTime addselectedDate = DateTime.now();
  bool isCircle1Checked = false;
  bool isCircle2Checked = false;
  bool isCircle3Checked = false;
  int selectedRemindValue = 5;
  String selectedRepeatValue = 'None';
  int selectedColor = 0;
  List<int> remindlist = [5, 10, 15, 20];
  List repeat = ['None', 'Daily', 'Weekly', 'Monthly', 'Annually'];

  Future<int> addTask({Task? task}) {
    return DBHelper.insert(task);
  }

  getTask() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.quere();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
    update();
  }

  void deleteTask(Task task) async {
    await DBHelper.delete(task);
    getTask();
  }

  void deleteAllTask() async {
    await DBHelper.deleteAll();
    getTask();
  }

  void makeIsCopleted(int id) async {
    await DBHelper.update(id);
    getTask();
  }

  void toggleTheme() {
    isDark = !isDark;
    Get.isDarkMode
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
    update();
  }

  onDateChange(DateTime newDate) {
    selectedDate = newDate;
    update();
  }

  Future<void> selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: addselectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate != null && pickedDate != addselectedDate) {
        addselectedDate = pickedDate;
      }
    });
    update();
  }

  Future<void> selectTime(BuildContext context, String time) async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime != null && pickedTime != TimeOfDay.now()) {
        time == 'start'
            ? startTime = pickedTime.format(context)
            : endTime = pickedTime.format(context);
      }
    });
    update();
  }

  onRemindChanged(newValue) {
    selectedRemindValue = int.parse(newValue!);
    update();
  }

  onRepeatChanged(newValue) {
    selectedRepeatValue = newValue!;
    update();
  }

  chooseCircleColor(int number) {
    if (number == 1) {
      isCircle1Checked = !isCircle1Checked;
      isCircle2Checked = false;
      isCircle3Checked = false;
      selectedColor = 0;
    } else if (number == 2) {
      isCircle2Checked = !isCircle2Checked;
      isCircle3Checked = false;
      isCircle1Checked = false;
      selectedColor = 1;
    } else {
      isCircle3Checked = !isCircle3Checked;
      isCircle1Checked = false;
      isCircle2Checked = false;
      selectedColor = 2;
    }
    update();
  }

  addTaskToDB() async {
    int value = await addTask(
        task: Task(
            title: titleController.text,
            note: noteController.text,
            isCompleted: 0,
            date: DateFormat.yMd().format(addselectedDate),
            startTime: startTime,
            endTime: endTime,
            color: selectedColor,
            remind: selectedRemindValue,
            repeat: selectedRepeatValue));

    print('$value');
    getTask();
  }

  myback() {
    Get.back();
    noteController.clear();
    titleController.clear();
    startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
    endTime = DateFormat('hh:mm a')
        .format(DateTime.now().add(const Duration(minutes: 15)))
        .toString();
    addselectedDate = DateTime.now();
    selectedRemindValue = 5;
    selectedRepeatValue = 'None';
    selectedColor = 0;
    update();
  }

  validateData() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      addTaskToDB();
      myback();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar('Required', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(115, 19, 19, 19),
          titleText: const Text(
            'Required',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 183, 19, 7),
                fontSize: 20),
          ),
          messageText: const Text(
            'All fields are required',
            style:
                TextStyle(color: Color.fromARGB(255, 183, 19, 7), fontSize: 17),
          ),
          colorText: const Color.fromARGB(255, 183, 19, 7),
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Color.fromARGB(255, 181, 13, 1),
            size: 30,
          ));
    } else {
      print('#########');
    }
  }

  @override
  void onInit() {
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    getTask();
    super.onInit();
  }
}
